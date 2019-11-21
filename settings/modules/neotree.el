(use-package
  neotree
  :bind
   (
    ([f8] . neotree-toggle)
    (:map neotree)
   )
  :init
  (setq neo-window-width 35)
  :config
  (progn (setq neo-smart-open nil)
  (setq neo-theme (if (display-graphic-p)   'icons 'arrow))
  (with-eval-after-load 'neotree
  (define-key neotree-mode-map (kbd "i") 'neotree-previous-line)
  (define-key neotree-mode-map (kbd "k") 'neotree-next-line)))
)
