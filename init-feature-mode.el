(autoload 'feature-mode "feature-mode")
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

(setq feature-default-language "en")

(provide 'init-feature-mode)
