;;----------------------------------------------------------------------------
;; I'm an HTML guy - I know what pixels are - I have no clue what a "row" is
;;----------------------------------------------------------------------------
(set '*px-display-width* nil)
(set '*px-display-height* nil)

(defcustom px-default-frame-height 800
  "Default frame height in pixels."
  :type 'integer
  :group 'pxframes)

(defcustom px-default-frame-width 640
  "Default frame width in pixels."
  :type 'integer
  :group 'pxframes)

(defcustom px-increment 80
  "Amount by which to readjust pixel based positions and dimensions"
  :type 'integer
  :group 'pxframes)

(require 'init-utils) ; for with-selected-frame

(defun set-frame-size-default-px (&optional frame)
  (init-px-frames-display-size)
  (with-selected-frame frame
    (message (format "Initialized new frame to %dx%d" px-default-frame-width px-default-frame-height))
    (set-frame-size-px (or frame (selected-frame))
		       px-default-frame-width
		       px-default-frame-height)))

(add-hook 'after-make-frame-functions 'set-frame-size-default-px)
(add-hook 'after-init-hook 'set-frame-size-default-px)

;; Manipulate frame sizes with pixels
(defun init-px-frames-display-size ()
  (set '*px-display-width* (condition-case nil
			       (x-display-pixel-width)
			     (error nil)))
  (set '*px-display-height* (condition-case nil
				(x-display-pixel-height)
			      (error nil)))
  (message (format "Detected display width: %dpx" (or *px-display-width* 0)))
  (message (format "Detected display height: %dpx" (or *px-display-height* 0))))

(defun frame-px-to-rows (px)
  (floor (/ px (frame-char-height))))

(defun frame-px-to-cols (px)
  (floor (/ px (frame-char-width))))

(defun set-frame-size-px (frame colpx rowpx)
  (set-frame-width-px frame colpx)
  (set-frame-height-px frame rowpx))

(defun set-frame-width-px (frame px)
  (if (and window-system *px-display-width* frame)
      (set-frame-width frame (frame-px-to-cols px))))

(defun set-frame-height-px (frame px)
  (if (and window-system *px-display-height* frame)
      (set-frame-height frame (frame-px-to-rows px))))

(defun inc-frame-width-px (frame px)
  (set-frame-width-px frame (+ px (frame-pixel-width))))

(defun inc-frame-height-px (frame px)
  (set-frame-height-px frame (+ px (frame-pixel-height))))

;; Ubuntu globally grabs C-s-<right/left/up/down> for window placement

;; Setup Ctrl-Super keybindings for frame resizing
;; (global-set-key (kbd "C-s-<right>") '(lambda ()
;;                                        (interactive)
;;                                        (inc-frame-width-px (selected-frame) px-increment)))
;; (global-set-key (kbd "C-s-<left>") '(lambda ()
;;                                          (interactive)
;;                                          (inc-frame-width-px (selected-frame) (- px-increment))))
;; (global-set-key (kbd "C-s-<up>") '(lambda ()
;;                                     (interactive)
;;                                     (inc-frame-height-px (selected-frame) px-increment)))
;; (global-set-key (kbd "C-s-<down>") '(lambda ()
;;                                       (interactive)
;;                                       (inc-frame-height-px (selected-frame) (- px-increment))))
(global-set-key (kbd "C-s-1") '(lambda ()
                                 (interactive)
                                 (set-frame-size-px (selected-frame)
                                                    (* *px-display-width* 0.3)
                                                    *px-display-height*)))
(global-set-key (kbd "C-s-2") '(lambda ()
                                 (interactive)
                                 (set-frame-size-px (selected-frame)
                                                    (* *px-display-width* 0.6)
                                                    *px-display-height*)))

(provide 'init-px-frames)
