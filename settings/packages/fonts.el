(use-package dynamic-fonts
  :disabled t
  :ensure t
  :config
  (progn
    (setq dynamic-fonts-preferred-monospace-point-size 10
          dynamic-fonts-preferred-monospace-fonts
          (-union '("Source Code Pro") dynamic-fonts-preferred-monospace-fonts))
    (dynamic-fonts-setup)))

(use-package unicode-fonts
  :ensure t
  :disabled t
  :init (unicode-fonts-setup))
