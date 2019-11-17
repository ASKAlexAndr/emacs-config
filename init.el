;; My name and e-mail adress
(setq user-full-name   "Alexandr Korotkov")
(setq user-mail-adress "ask.97.alexandr@gmail.com")

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '()
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


;; Electric-modes settings
(electric-pair-mode    1) ;; autoclose {},[],()
(electric-indent-mode -1) ;; autotab

;; Backups
(setq make-backup-files nil)

;; Line numbers
(global-display-line-numbers-mode)

;; reload emacs configuration
(defun reload-init-file ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(global-set-key (kbd "C-c r") 'reload-init-file) 

;; load vendor and custom files
(defvar emacs-dir (file-name-directory load-file-name)
  "top level emacs dir")

(defvar module-dir (concat emacs-dir "modules/")
  "The core of my emacs config")

;; Add to load path
(add-to-list 'load-path module-dir)

;; Require packages in modules/
(mapc 'load (directory-files module-dir nil "^[^#].*el$"))
(server-start)
