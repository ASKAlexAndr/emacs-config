(use-package yasnippet

  :init
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
  :config
  (yas-global-mode 1)
   (define-key yas-minor-mode-map (kbd "C-i") nil))


(use-package yasnippet-snippets
  :init
  ;; Checking existing 'snippets' dir. Required for yasnippet.
  (unless (file-directory-p "~/.emacs.d/snippets/") (mkdir "~/.emacs.d/snippets/"))
  :requires yasnippet)
