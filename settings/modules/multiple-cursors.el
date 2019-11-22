(use-package multiple-cursors
  :ensure t
  :bind (
         ("C-'" . mc/mark-next-like-this)
         ("C-\"" . mc/mark-previous-like-this)
         ;; Adds a cursor to each line in active region
         ("C-c '" . mc/edit-lines)))
