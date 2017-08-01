;;; Malabar mode setup, requires: cedet and semantic
;;; @see https://github.com/m0smith/malabar-mode

;;;
;;; Attempt to copy install bunubot
;;;
;; (require 'cedet)
;; (require 'semantic)
;; (load "semantic/loaddefs.el")
;; (semantic-mode 1)

                                        ;(add-to-list 'load-path "~/.emacs.d/site-lisp/malabar/current/lisp")
;; (require 'malabar-mode)

;; (add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))

;;;
;;; Attempting to manually install 1.x
;;;
;; ;;(add-to-list 'load-path "~/.emacs.d/site-lisp/malabar/malabar-1.4.0/lisp")
;; (require 'cedet)
;; (require 'semantic)
;; (load "semantic/loaddefs.el")
;; (semantic-mode 1)

;; (add-to-list 'load-path "~/.emacs.d/site-lisp/malabar/current/lisp")
;; (require 'malabar-mode)

;; ;;(setq malabar-groovy-lib-dir "~/.emacs.d/site-lisp/malabar/malabar-1.4.0/lib")
;; ;(setq malabar-groovy-lib-dir "~/.emacs.d/site-lisp/malabar/current/lib")

;; (add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))


;;;
;;; Attempting to install 2.x
;;;

;; Manually installed groovy-mode from melpa, version 20141209.1133,
;; the automatic install via 'require-package would only install the
;; old version from melpa-stable
;;(require-package 'groovy-mode)
;; (require-package 'malabar-mode)


                                        ;
;; (add-hook 'after-init-hook (lambda ()
;;                              (message "activate-malabar-mode")
;;                              (activate-malabar-mode)))
;; (add-hook 'malabar-java-mode-hook 'flycheck-mode)
;; (add-hook 'malabar-groovy-mode-hook 'flycheck-mode)

;; (add-hook 'malabar-mode-hook
;;           (lambda ()
;;             (add-hook 'after-save-hook
;;                       'malabar-compile-file-silently nil t)))

;; Use `jtags-extras-organize-imports' to organize java import
;; ;; statements after importing via malabar or on save
;; (require-package 'jtags)
;; (autoload 'jtags-mode "jtags" "Toggle jtags mode." t)

(custom-set-variables
 '(jtags-extras-import-order-list
   '("^static[\s]+"
     "-"
     "^io.vos\."
     "^proto\."
     "-"
     "^com\."
     "^io\."
     "^org\.(?!junit)"
     "^net\."
     "-"
     "^java\."
     "^javax\."
     "-"
     "^org\.junit\."))
 ;; '(malabar-import-post-insert-function 'jtags-extras-organize-imports)
 )

;; Adds the hook only in java-mode. see:
;; http://stackoverflow.com/questions/6138029/how-to-add-a-hook-to-only-run-in-a-particular-mode
(add-hook 'java-mode-hook
          (lambda ()
            (add-hook 'before-save-hook
                      'jtags-extras-organize-imports nil t)))

;;; javadoc-lookup sources
;;; @see http://nullprogram.com/blog/2013/01/30/
(require-package 'javadoc-lookup)

(add-hook 'after-init-hook
          (lambda ()
            (javadoc-add-roots "/usr/share/javadoc/java")))
(javadoc-add-artifacts [com.google.guava guava "21.0"]
                       [junit junit 4.12])

(add-hook 'java-mode-hook
          (lambda ()
            (local-set-key "j" (quote javadoc-lookup))))

;;; Fix indenting after wrapping after an annotation
(defun my-custom-java-mode-annoations-setup ()
  "Additional setup from `malabar-annotations-setup' for lining
  up statements following an annotation with the
  annotation. Rather than indenting."
  (c-prepend-offset 'annotation-var-cont 'c-no-indent-after-java-annotations))

; Use google-c-style for Java editing
(require-package 'google-c-style)
(defun my-setup-java-style ()
  "Sets the current buffers' java-style. Meant to be added to the
   `java-mode-hook'."
  (interactive)
  (google-make-newline-indent)
  (google-set-c-style)
  (setq fill-column 100)
;;   (my-custom-java-mode-annoations-setup)
  (setq tab-width 2))

(add-hook 'java-mode-hook 'jtags-mode)
(add-hook 'java-mode-hook 'subword-mode)
(add-hook 'java-mode-hook 'my-setup-java-style)

(provide 'init-java)
