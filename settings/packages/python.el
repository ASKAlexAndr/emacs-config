(use-package python-mode
  :mode ("\\.py\\'" . python-mode)
  :init(add-hook 'python-mode-hook #'elpy-enable)
  :config
  (use-package elpy
    :bind
    ("M-," . elpy-goto-definition)
    :init
    (elpy-enable)
    (defalias 'workon 'pyvenv-workon)
    :config
    (add-to-list 'company-backends 'elpy-company-backend)
    (elpy-enable))
  (use-package py-autopep8
    :hook
    (python-mode . py-autopep8-enable-on-save))
  (use-package py-isort
    :init
    (add-hook 'before-save-hook #'py-isort-before-save)))
