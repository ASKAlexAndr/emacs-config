(use-package
  company
  :diminish company-mode
  :config (setq company-backends (remove 'company-ropemacs company-backends) company-tooltip-limit
                20 company-tooltip-align-annotations t)
  (global-company-mode 1))

;; Python auto completion
  (use-package company-jedi
    :defer t
    :config
    (add-to-list 'company-backends 'company-jedi))

  (use-package company-web
    :ensure t
    :bind (("C-c w" . company-web-html))
    :config
    (add-to-list 'company-backends 'company-web-html))
