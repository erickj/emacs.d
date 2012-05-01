;;----------------------------------------------------------------------------
;; I'm an HTML guy - I know what pixels are - I have no clue what a "row" is
;;----------------------------------------------------------------------------
(setq *px-display-width* (x-display-pixel-width))
(setq *px-display-height* (x-display-pixel-height))

(defcustom px-default-frame-width (* 80 (frame-char-width))
  "Default frame width in pixels."
  :type 'integer)

(defcustom px-default-frame-height *px-display-height*
  "Default frame height in pixels."
  :type 'integer)

(require 'init-utils) ; for with-selected-frame

(defun set-frame-size-default-px (&optional frame)
  (with-selected-frame frame
    (set-frame-size-px (or frame (selected-frame))
                       px-default-frame-width
                       px-default-frame-height)))

(add-hook 'after-make-frame-functions 'set-frame-size-default-px)
(add-hook 'after-init-hook 'set-frame-size-default-px)

;; Manipulate frame sizes with pixels
(defun frame-px-to-rows (px)
  (/ px (frame-char-height)))

(defun frame-px-to-cols (px)
  (/ px (frame-char-width)))

(defun set-frame-size-px (frame colpx rowpx)
  (if window-system
      (set-frame-size frame (frame-px-to-cols colpx) (frame-px-to-rows rowpx))))

(defun set-frame-width-px (frame px)
  (if window-system
      (set-frame-width frame (frame-px-to-cols px))))

(defun set-frame-height-px (frame px)
  (if window-system
      (set-frame-height frame (frame-px-to-rows px))))

(defun inc-frame-width-px (frame px)
  (set-frame-width-px frame (+ px (frame-pixel-width))))

(defun inc-frame-height-px (frame px)
  (set-frame-height-px frame (+ px (frame-pixel-height))))


;; Setup Ctrl-Super keybindings for frame resizing
(global-set-key (kbd "C-s-<right>") '(lambda ()
                                       (interactive)
                                       (inc-frame-width-px (selected-frame) 80)))
(global-set-key (kbd "C-s-<left>") '(lambda ()
                                         (interactive)
                                         (inc-frame-width-px (selected-frame) -80)))
(global-set-key (kbd "C-s-<up>") '(lambda ()
                                    (interactive)
                                    (inc-frame-height-px (selected-frame) 80)))
(global-set-key (kbd "C-s-<down>") '(lambda ()
                                      (interactive)
                                      (inc-frame-height-px (selected-frame) -80)))
(global-set-key (kbd "C-s-1") '(lambda ()
                                 (interactive)
                                 (set-frame-size-px (selected-frame)
                                                    *px-display-width*
                                                    *px-display-height*)))
(global-set-key (kbd "C-s-2") '(lambda ()
                                 (interactive)
                                 (set-frame-size-px (selected-frame)
                                                    (/ *px-display-width* 2)
                                                    *px-display-height*)))

(provide 'init-px-frames)