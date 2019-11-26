(require-package 'protobuf-mode)
(require 'protobuf-mode)

(add-to-list 'auto-mode-alist '("\\.proto\\'" . protobuf-mode))

;(eval-after-load 'flycheck
;  '(require 'flycheck-protobuf))
;(add-to-list 'flycheck-checkers 'protobuf-protoc-reporter t)

(provide 'init-protobuf)
