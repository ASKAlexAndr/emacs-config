(use-package all-the-icons
  :if window-system
  :ensure t
  :config
  (when (not (member "all-the-icons" (font-family-list)))
    (all-the-icons-install-fonts t)))
