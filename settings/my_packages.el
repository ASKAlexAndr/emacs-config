(require 'package)

(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa"        . "http://melpa.org/packages/"))
(setq package-enable-at-startup nil)
(package-initialize nil)

(unless (package-installed-p 'use-package)
  (message "EMACS install use-package.el")
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Packages
(defvar package-dir  "~/.emacs.d/settings/packages")

(defun load-user-package (file)
  (interactive "f")
  (load-file (expand-file-name file package-dir)))

(load-user-package "company.el")
(load-user-package "all-the-icons.el")
(load-user-package "neotree.el")
(load-user-package "yasnippet.el")
(load-user-package "projectile.el")
(load-user-package "yafolding.el")
(load-user-package "helm.el")
(load-user-package "magit.el")
(load-user-package "flycheck.el")
(load-user-package "web-mode.el")
(load-user-package "web-beautify.el")
(load-user-package "emmet-mode.el")
(load-user-package "multiple-cursors.el")
(load-user-package "smart-tabs-mode.el")
(load-user-package "python.el")
(load-user-package "fonts.el")
(load-user-package "hydra.el")
(load-user-package "google-this.el")

;; Themes
(defvar themes-dir  "~/.emacs.d/settings/themes")

(defun load-user-theme (file)
  (interactive "f")
  (load-file (expand-file-name file themes-dir)))

(load-user-theme "switch-theme.el")

(load-user-theme "cyberpank-theme.el")
(load-user-theme "doom-theme.el")
(load-user-theme "monokai-theme.el")
(load-user-theme "waher.el")
(load-user-theme "material.el")
(load-user-theme "zerodark-theme.el")
(load-user-theme "moe-theme.el")
(load-user-theme "seti-theme.el")
(load-user-theme "green-screen-theme.el")
(load-user-theme "grandshell-theme.el")
(load-user-theme "ample-theme.el")
(load-user-theme "abyss-theme.el")
(load-user-theme "dark-mint-theme.el")
(load-user-theme "firecode-theme.el")

(provide 'my_packages)
