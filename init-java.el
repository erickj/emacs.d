;; @see https://github.com/m0smith/malabar-mode
(require 'cedet)
(require 'semantic)
(load "semantic/loaddefs.el")
(semantic-mode 1);;

(require 'malabar-mode)
(add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))

(autoload 'jtags-mode "jtags" "Toggle jtags mode." t)

;; Use `jtags-extras-organize-imports' to organize java import
;; statements after importing via malabar or on save
(custom-set-variables
 '(jtags-extras-import-order-list
   '("^io.vos\\."
     "-"
     "^com\\."
     "-"
     "^org\\."
     "-"
     "^net\\."
     "-"
     "^java\\."
     "^javax\\."
     "-"
     "^junit\\."))
 '(malabar-import-post-insert-function 'jtags-extras-organize-imports))

;; Adds the hook only in java-mode. see:
;; http://stackoverflow.com/questions/6138029/how-to-add-a-hook-to-only-run-in-a-particular-mode
(add-hook 'java-mode-hook
          (lambda ()
            (add-hook 'before-save-hook
                      'jtags-extras-organize-imports nil t)))

(defun my-custom-java-mode-annoations-setup ()
  "Additional setup from `malabar-annotations-setup' for lining
  up statements following an annotation with the
  annotation. Rather than indenting."
  (c-prepend-offset 'annotation-var-cont 'c-no-indent-after-java-annotations))

(require 'google-c-style)
(defun my-setup-java-style ()
  "Sets the current buffers' java-style. Meant to be added to the
  `java-mode-hook'."
  (interactive)
  (google-make-newline-indent)
  (google-set-c-style)
  (setq fill-column 100)
  (my-custom-java-mode-annoations-setup)
  (setq tab-width 2))

(add-hook 'java-mode-hook 'jtags-mode)
(add-hook 'java-mode-hook 'subword-mode)
(add-hook 'java-mode-hook 'my-setup-java-style)

(provide 'init-java)
