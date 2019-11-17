(require 'package)
(setq package-list
      '(
        el-get
        all-the-icons
        json-mode
        flycheck
        expand-region
        emmet-mode
        yasnippet
        yasnippet-snippets
        magit
	)
)

(when (executable-find "python")
    (add-to-list 'package-list 'pip-requirements)
    (when (executable-find "autopep8")
      (add-to-list 'package-list 'py-autopep8)
      )
    (add-to-list 'package-list 'py-isort)
    ;(when (executable-find "virtualenv")
    ;  (add-to-list 'package-list 'auto-virtualenv))

    ;; (when (executable-find "virtualenvwrapper")
    ;;   (add-to-list 'package-list 'auto-virtualenvwrapper))
)

;; for gnu repository
(setq package-check-signature nil)
;; bug fix for gnu
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil t)
  (package-refresh-contents)
  (package-install 'el-get)
  (package-install 'async)
  (package-install 'jsonrpc)
  (package-install 'cl-lib)
  (package-install 'memoize)
  (package-install 'flymake)
  (message "require is")
  (require 'el-get)
  (el-get 'sync))

(add-to-list 'el-get-recipe-path "~/.emacs.d/packages/recipes")

(el-get 'sync package-list)

(require 'el-get-elpa)
;; Build the El-Get copy of the package.el packages if we have not
;; built it before.  Will have to look into updating later ...
(unless (file-directory-p el-get-recipe-path-elpa)
  (el-get-elpa-build-local-recipes))

(provide 'my_packages)
