;;; elixir-compile.el --- Elixir's compile integration

;;; Commentary:
;;

;;; Code:

(defcustom elixir-compile-command "elixirc"
  "The shell command for elixirc."
  :type 'string
  :group 'elixir-compile)

(defcustom elixir-compile-execute-command "elixir"
  "The shell command for elixir."
  :type 'string
  :group 'elixir-compile)

(defvar elixir-compile-buffer-name "*elixirc*"
  "Name of the elixirc output buffer.")

(defvar elixir-compile-execute-buffer-name "*elixir*"
  "Name of the elixir output buffer.")

(defun elixir-compile-this-buffer ()
  "Run the current buffer through elixirc."
  (interactive)
  (elixir-compile--file buffer-file-name))

(defun elixir-compile-execute-this-buffer ()
  "Run the current buffer through elixirc."
  (interactive)
  (elixir-compile--execute-file buffer-file-name))

(defun elixir-compile-file (filename)
  "Run elixir with the given `FILENAME`."
  (interactive "Felixirc: ")
  (elixir-compile--file (expand-file-name filename)))

(defun elixir-compile-execute-file (filename)
  "Run elixir with the given `FILENAME`."
  (interactive "Felixirc: ")
  (elixir-compile--execute-file (expand-file-name filename)))

(defun elixir-compile--file (filename)
  (when (not (file-exists-p filename))
    (error "The given file doesn't exists"))
  (elixir-compile-run (list elixir-compile-command (expand-file-name filename))))

(defun elixir-compile--execute-file (filename)
  (when (not (file-exists-p filename))
    (error "The given file doesn't exists"))
  (elixir-compile-execute (list elixir-compile-execute-command (expand-file-name filename))))

(defun elixir-compile--read-command (command)
  (read-shell-command "elixirc command: " (concat command " ")))

(defun elixir-compile--execute-read-command (command)
  (read-shell-command "elixir command: " (concat command " ")))

(defun elixir-compile (cmdlist)
  "Run a elixirc with `CMDLIST`."
  (interactive (list (elixir-compile--read-command elixir-compile-command)))
  (elixir-compilation-run (elixir-utils-build-runner-cmdlist cmdlist)
                          elixir-compile-buffer-name))

(defun elixir-compile-execute (cmdlist)
  "Run a elixir with `CMDLIST`."
  (interactive (list (elixir-compile--execute-read-command elixir-compile-execute-command)))
  (elixir-compilation-run (elixir-utils-build-runner-cmdlist cmdlist)
                          elixir-compile-execute-buffer-name))

(provide 'elixir-compile)

;;; elixir-compile.el ends here
