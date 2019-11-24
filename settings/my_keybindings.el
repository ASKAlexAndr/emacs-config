;; keybindings

;; tab indent or complete
(defun check-expansion ()
  (save-excursion
    (if (looking-at "\\_>") t
      (backward-char 1)
      (if (looking-at "\\.") t
        (backward-char 1)
        (if (looking-at "->") t nil)))))

(defun do-yas-expand ()
  (let ((yas/fallback-behavior 'return-nil))
    (yas/expand)))

(defun tab-indent-or-complete ()
  (interactive)
  (message (minibufferp))
  (if (minibufferp)
      (minibuffer-complete)
    (if (or (not yas/minor-mode)
            (null (do-yas-expand)))
        (if (check-expansion)
            (company-complete-common)
          (indent-for-tab-command)))))

(global-unset-key [tab])
(global-set-key [tab] 'tab-indent-or-complete)
(global-set-key (kbd "<backtab>") 'tab-indent-or-complete)

;; Switch window
(bind-key* "M-o" 'other-window)

;; Moving
(bind-key* "C-i" 'previous-line)
(bind-key* "C-j" 'backward-char)
(bind-key* "C-k" 'next-line)
(bind-key* "C-l" 'forward-char)

(bind-key* "C-," 'left-char)
(bind-key* "C-." 'right-char)

(bind-key* "C-o" 'forward-word)

(bind-key* "C-u" 'backward-word)

;; Yank
(global-unset-key (kbd "C-v"))
(global-unset-key (kbd "C-y"))

(bind-key* "C-v" 'yank)

(global-set-key (kbd "C-y") 'scroll-up-command)

(global-set-key (kbd "C-x C-b") 'electric-buffer-list)

;; Undo
(global-unset-key (kbd "C-z"))
(bind-key* "C-z" 'undo)
            
;; Move text
(defun move-text-internal (arg)
  (cond
   ((and mark-active transient-mark-mode)
    (if (> (point) (mark))
        (exchange-point-and-mark))
    (let ((column (current-column))
          (text (delete-and-extract-region (point) (mark))))
      (forward-line arg)
      (move-to-column column t)
      (set-mark (point))
      (insert text)
      (exchange-point-and-mark)
      (setq deactivate-mark nil)))
   (t
    (let ((column (current-column)))
      (beginning-of-line)
      (when (or (> arg 0) (not (bobp)))
        (forward-line)
        (when (or (< arg 0) (not (eobp)))
          (transpose-lines arg)
          (when (and (eval-when-compile
                       '(and (>= emacs-major-version 24)
                             (>= emacs-minor-version 3)))
                     (< arg 0))
            (forward-line -1)))
        (forward-line -1))
      (move-to-column column t)))))

(defun move-text-down (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines down."
  (interactive "*p")
  (move-text-internal arg))

(defun move-text-up (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines up."
  (interactive "*p")
  (move-text-internal (- arg)))	      

(global-set-key [M-S-up] 'move-text-up)
(global-set-key [M-S-down] 'move-text-down)

;; duplicate line
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
  )
(global-unset-key (kbd "C-x C-d"))
(global-set-key (kbd "C-x C-d") 'duplicate-line)

;; copy line
(defun copy-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (kill-ring-save (line-beginning-position)
                  (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

(global-unset-key (kbd "C-c C-k"))
(global-set-key (kbd "C-c C-k") 'copy-line)

;; delete line
(defun my-delete-line ()
  "Delete text from current position to end of line char."
  (interactive)
  (kill-region
   (move-beginning-of-line 1)
   (save-excursion (move-end-of-line 1) (point)))
  (delete-char 1)
  )

(global-unset-key (kbd "C-d"))
(global-set-key (kbd "C-d") 'my-delete-line)

(global-set-key (kbd "RET") 'newline)
(global-set-key (kbd "M-RET") 'newline-and-indent)

(defun end-of-line-and-indented-new-line ()
  (interactive)
  (end-of-line)
  (newline-and-indent))

(bind-key* "<S-return>" 'end-of-line-and-indented-new-line)

;; reload emacs configuration
(defun reload-init-file ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(global-set-key (kbd "C-c r") 'reload-init-file) 

;; emacs comment
(global-set-key (kbd "C-x /") 'comment-or-uncomment-region)

(provide 'my_keybindings)
