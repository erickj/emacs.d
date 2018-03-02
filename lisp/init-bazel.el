(add-auto-mode 'python-mode
               "BUILD\\'" "WORKSPACE\\'" "\\.bzl\\'")

(defvar bazel-workspace "/home/erick/workspace/src/io.vos")

(defun bazel-absolute-file-name (file-name)
  (expand-file-name file-name bazel-workspace))

(defun bazel-relative-file-name(file-name)
  (file-relative-name file-name bazel-workspace))

(defun bazel-relative-buffer-file-name (&optional buffer)
  (bazel-relative-file-name (buffer-file-name buffer)))

(defun bazelify-buffer-file-name()
  (let (file-name dir-name bazel-relative-path)
    (setq bazel-relative-path (bazel-relative-buffer-file-name))
    (setq file-name (file-name-nondirectory bazel-relative-path))
    (setq dir-name (string-remove-suffix "/" (file-name-directory bazel-relative-path)))
    (concat "//" dir-name ":" file-name)
    ))

(require 'flycheck)
(flycheck-define-checker bazel-checker
  "A simple bazel compilation check for compiling a
   random target that depends on the source file.

See URL `https://docs.bazel.build/versions/master/command-line-reference.html'"
  :command ("bazel"
            "build"
            "--color=no"
            "--compile_one_dependency" ;; Compile a single dependency
            ;; of the argument files. This is useful for syntax
            ;; checking source files in IDEs, for example, by
            ;; rebuilding a single target that depends on the source
            ;; file
            (eval (bazelify-buffer-file-name)))
  :error-patterns
  (
   (error line-start (file-name) ":" line ": error:"
          (message (zero-or-more not-newline "\n")
                   (one-or-more not-newline)
                   (zero-or-more "\n" (one-or-more space) (one-or-more any)))
          line-end))
  :error-filter
  (lambda (errors)
    (dolist (err errors)
      (when (string= (bazel-relative-buffer-file-name (flycheck-error-buffer err))
                     (flycheck-error-filename err))
        (setf (flycheck-error-filename err) nil)))
    errors)
  :modes (java-mode)
  ;; I don't know how to access 'bazel-workspace here
  :working-directory (lambda (checker) "/home/erick/workspace/src/io.vos"))
(add-to-list 'flycheck-checkers 'bazel-checker)

(provide 'init-bazel)
