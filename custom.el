(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#515151" "#f2777a" "#99cc99" "#ffcc66" "#6699cc" "#cc99cc" "#66cccc" "#cccccc"))
 '(beacon-color "#f2777a")
 '(browse-url-browser-function (quote eww-browse-url))
 '(browse-url-firefox-program "firefox")
 '(browse-url-firefox-startup-arguments nil)
 '(c-offsets-alist (quote ((arglist-cont-nonempty . +))))
 '(clang-format-executable "/opt/llvm-5.0.1/bin/clang-format")
 '(custom-enabled-themes (quote (smart-mode-line-dark sanityinc-tomorrow-eighties)))
 '(custom-safe-themes
   (quote
    ("43c1a8090ed19ab3c0b1490ce412f78f157d69a29828aa977dae941b994b4147" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" default)))
 '(desktop-auto-save-timeout 600)
 '(desktop-buffers-not-to-save "^(\\`|*)")
 '(desktop-save-mode nil)
 '(fci-dash-pattern 0.65)
 '(fci-rule-color "#515151")
 '(fci-rule-use-dashes nil)
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(frame-background-mode (quote dark))
 '(fringe-mode nil nil (fringe))
 '(global-whitespace-cleanup-mode t)
 '(jtags-etags-command
   "/home/workspace/src/io.vos/gentags.sh /home/workspace/src/io.vos")
 '(jtags-extras-import-order-list
   (quote
    ("^static[ ]+" "-" "^io.vos." "^proto." "-" "^com." "^io." "^org." "^net." "-" "^java." "^javax." "-" "^org.junit.")))
 '(jtags-javadoc-root-alist
   (quote
    (("^java\\." . "https://docs.oracle.com/javase/8/docs/api")
     ("^javax\\." . "https://docs.oracle.com/javase/8/docs/api")
     ("^io.vertx\\." . "http://vertx.io/docs/apidocs")
     ("^io.reactivex\\." . "http://reactivex.io/RxJava/2.x/javadoc/")
     ("^org.reactivestreams\\." . "http://www.reactive-streams.org/reactive-streams-1.0.0-javadoc/")
     ("^com.google.protobuf\\." . "https://developers.google.com/protocol-buffers/docs/reference/java/"))))
 '(malabar-import-post-insert-function (quote jtags-extras-organize-imports))
 '(markdown-command "markdown")
 '(package-selected-packages
   (quote
    (org dired-sidebar leuven-theme javadoc-import clang-format flycheck typescript-mode rspec-mode smart-mode-line-powerline-theme smart-mode-line yard-mode yari yaml-mode yagist whole-line-or-region whitespace-cleanup-mode wgrep vc-darcs unfill undo-tree tidy textile-mode tagedit switch-window sql-indent smex smarty-mode skewer-less session scss-mode scratch sass-mode ruby-hash-syntax robe rinari regex-tool redshank rainbow-mode rainbow-delimiters project-local-variables pip-requirements php-mode paredit-everywhere page-break-lines org-pomodoro org-fstree mwe-log-commands multiple-cursors move-dup mmm-mode markdown-mode malabar-mode magit-svn magit-gh-pulls macrostep lua-mode lively less-css-mode ledger-mode jtags json-mode js-comint javadoc-lookup ipretty idomenu ido-ubiquitous ibuffer-vc htmlize hl-sexp hippie-expand-slime highlight-symbol highlight-quoted highlight-escape-sequences hi2 hayoo guide-key google-c-style gnuplot gitignore-mode github-clone github-browse-file gitconfig-mode git-timemachine git-messenger git-blame ghci-completion fullframe flycheck-protobuf flycheck-package flycheck-ledger flycheck-hdevtools flycheck-haskell flycheck-clojure fill-column-indicator expand-region exec-path-from-shell erlang elisp-slime-nav elein dsvn dired-sort dired+ diminish diff-hl default-text-scale darcsum csv-nav csv-mode css-eldoc crontab-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode cljsbuild-mode cl-lib-highlight bug-reference-github browse-kill-ring auto-compile anzu aggressive-indent ace-jump-mode ac-slime ac-js2 ac-inf-ruby ac-haskell-process ac-cider)))
 '(ruby-deep-arglist nil)
 '(ruby-deep-indent-paren nil)
 '(ruby-deep-indent-paren-style nil)
 '(ruby-indent-level 2)
 '(ruby-indent-tabs-mode nil)
 '(ruby-use-encoding-map nil)
 '(safe-local-variable-values
   (quote
    ((no-byte-compile t)
     (ruby-compilation-executable . "ruby")
     (ruby-compilation-executable . "ruby1.8")
     (ruby-compilation-executable . "ruby1.9")
     (ruby-compilation-executable . "rbx")
     (ruby-compilation-executable . "jruby"))))
 '(session-use-package t nil (session))
 '(show-trailing-whitespace t)
 '(shr-use-fonts nil)
 '(sml/theme (quote dark))
 '(switch-window-shortcut-style (quote alphabet))
 '(switch-window-threshold 3)
 '(tags-table-list
   (quote
    ("/usr/local/src/java/TAGS" "/home/erick/workspace/src/io.vos/TAGS")))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f2777a")
     (40 . "#f99157")
     (60 . "#ffcc66")
     (80 . "#99cc99")
     (100 . "#66cccc")
     (120 . "#6699cc")
     (140 . "#cc99cc")
     (160 . "#f2777a")
     (180 . "#f99157")
     (200 . "#ffcc66")
     (220 . "#99cc99")
     (240 . "#66cccc")
     (260 . "#6699cc")
     (280 . "#cc99cc")
     (300 . "#f2777a")
     (320 . "#f99157")
     (340 . "#ffcc66")
     (360 . "#99cc99"))))
 '(vc-annotate-very-old-color nil)
 '(window-system-color-theme (quote color-theme-sanityinc-eighties)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(shr-link ((t (:inherit link :foreground "alice blue" :underline "dodger blue")))))
