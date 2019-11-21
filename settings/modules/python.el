(use-package
  python
  :mode ("\\.py'" . python-mode)
  :init (progn
          (defalias 'python2-mode 'python-mode)
          (defalias 'python3-mode 'python-mod))
  :config (setq-default py-separator-char 47) ;; Use spaces instead tab
  (setq-default python-indent-offset 4) ;; 4 spaces instead 2 for python-mode
  )

(use-package
  py-autopep8
  :init (progn (add-hook 'python-mode-hook 'py-autopep8-enable-on-save)))

(use-package
  pyvenv
  :config (defalias 'workon 'pyvenv-workon))
