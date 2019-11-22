(add-to-list 'auto-mode-alist '("\\.hql\\'" . sql-mode))
(add-to-list 'auto-mode-alist '("\\.bashrc\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.fish\\'" . fish-mode))
(add-to-list 'auto-mode-alist '("Pipfile" . conf-toml-mode))
(add-to-list 'auto-mode-alist '("docker-compose[^/]*\\.yml\\'" . docker-compose-mode))

(provide 'my_hooks)
