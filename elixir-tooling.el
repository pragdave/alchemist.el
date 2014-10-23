;;; elixir-tooling.el --- Elixir tooling integration into emacs

;; Author: Samuel Tonini
;; Maintainer: Samuel Tonini
;; Version: 0.0.1

;;; Commentary:
;;


;;;###autoload
(define-minor-mode elixir-tooling-mode
  "Toggle elixir-tooling mode.

When elixir-tooling mode is enabled, the follwing elixir modes will be loaded:
* elixir-compilation-mode
* elixir-compile
* elixir-execute
* elixir-mix
* elixir-iex"
  nil
  ;; The indicator for the mode line.
  " elixir-tooling"
  :group 'elixir-tooling
  (cond (elixir-tooling-mode
         (require 'elixir-utils)
         (require 'elixir-compilation)
         (require 'elixir-compile)
         (require 'elixir-mix))))

(provide 'elixir-tooling)

;;; elixir.el ends here
