(use-package helm
  :ensure t
  :bind (("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files)
         ("C-x f" . helm-recentf)
         ("C-SPC" . helm-dabbrev)
         ("M-y" . helm-show-kill-ring)
         ("C-x b" . helm-buffers-list))
  :bind (:map helm-map
              ("M-i" . helm-previous-line)
              ("M-k" . helm-next-line)
              ("M-I" . helm-previous-page)
              ("M-K" . helm-next-page)
              ("M-h" . helm-beginning-of-buffer)
              ("M-H" . helm-end-of-buffer)
              ("<tab>" . helm-execute-persistent-action)
              ("C-i" . helm-execute-persistent-action))
  :config (progn
            (helm-mode 1)
	    (substitute-key-definition 'find-tag 'helm-etags-select global-map)
  ;; Display helm buffers always at the bottom
  ;; Source: http://www.lunaryorn.com/2015/04/29/the-power-of-display-buffer-alist.html
  (add-to-list 'display-buffer-alist
               `(,(rx bos "*helm" (* not-newline) "*" eos)
                 (display-buffer-reuse-window display-buffer-in-side-window)
                 (reusable-frames . visible)
                 (side            . bottom)
                 (window-height   . 0.4)))
  :diminish (helm-mode))
)

(use-package helm-projectile
  :ensure t
  :config (helm-projectile-on))
