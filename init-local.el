(defun setup-frame-local (frame)
  "This function will setup my frames with the correct parameters since emacsclient does not want to do this automatically"
  (set-frame-parameter frame 'font "Inconsolata-10"))

(add-hook 'after-make-frame-functions 'setup-frame-local)

(provide 'init-local)