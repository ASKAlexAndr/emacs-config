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

;; (setq package-list
;;       '(
;;         el-get
;;         all-the-icons
;;         flycheck
;;         expand-region
;;         markdown-mode
;;         magit     
;;         restclient
;;         company-mode
;;         company-flx
;;         company-restclient
;;         jedi-core
;;         company-jedi
;;         font-lock+
;;         smart-mode-line
;;         js2-mode
;;         projectile
;;         neotree
;;         yasnippet
;;         yasnippet-snippets
;;         yafolding
;;         smart-tabs-mode
;;         emmet-mode
;;         helm      
;;         helm-projectile
;;         helm-swoop
;; 	)             
;; )


(defvar module-dir  "~/.emacs.d/settings/modules")

(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file module-dir)))

(load-user-file "company.el")
(load-user-file "all-the-icons.el")
(load-user-file "neotree.el")
(load-user-file "yasnippet.el")
(load-user-file "projectile.el")
(load-user-file "yafolding.el")
(load-user-file "helm.el")
(load-user-file "magit.el")
(load-user-file "flycheck.el")
(load-user-file "web-mode.el")
(load-user-file "web-beautify.el")
(load-user-file "emmet-mode.el")
(load-user-file "python.el")
(load-user-file "multiple-cursors.el")
(load-user-file "smart-tabs-mode.el")
(provide 'my_packages)
