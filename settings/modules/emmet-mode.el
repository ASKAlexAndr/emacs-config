(use-package emmet-mode
  :diminish (emmet-mode . "ε")
  :bind*  (("C-)" . emmet-next-edit-point)
          ("C-(" . emmet-prev-edit-point)
          ("C-b" . emmet-expand-line)
)
  :commands (emmet-mode
             emmet-next-edit-point
             emmet-prev-edit-point)
  :init
  (setq emmet-indentation 2)
  (setq emmet-move-cursor-between-quotes t)
  :config
  ;; Auto-start on any markup modes
  (add-hook 'sgml-mode-hook 'emmet-mode)
  (add-hook 'web-mode-hook 'emmet-mode)
  (define-key emmet-mode-keymap(kbd "C-j") nil)
)

