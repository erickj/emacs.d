(defun setup-frame-local (frame)
  "This function will setup my frames with the correct parameters since emacsclient does not want to do this automatically"
  (set-frame-parameter frame 'font "Inconsolata-10"))

(defun visit-term-buffer ()
  "Create or visit a terminal buffer."
  (interactive)
  (if (not (get-buffer "*ansi-term*"))
      (progn
        (split-window-sensibly (selected-window))
        (other-window 1)
        (ansi-term (getenv "SHELL")))
    (switch-to-buffer-other-window "*ansi-term*")))
(global-set-key (kbd "C-c t") 'visit-term-buffer)

(electric-pair-mode t)

(add-hook 'after-make-frame-functions 'setup-frame-local)

(global-set-key (kbd "s-r") 'revert-buffer)

(provide 'init-local)
