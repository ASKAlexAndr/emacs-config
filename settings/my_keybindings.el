;; keybindings
;; Switch window
(global-set-key (kbd "<C-tab>") 'other-window)
;; Up
(global-unset-key (kbd "C-i"))
(global-set-key (kbd "C-i") 'previous-line)
;; Right
(global-unset-key (kbd "C-k"))
(global-set-key (kbd "C-k") 'next-line)
;; Left
(global-unset-key (kbd "C-j"))
(global-set-key (kbd "C-j") 'backward-char)
;; Down
(global-unset-key (kbd "C-l"))
(global-set-key (kbd "C-l") 'forward-char)
;; Right word
(global-unset-key (kbd "C-o"))
(global-set-key (kbd "C-o") 'forward-word)
;; Left word
(global-unset-key (kbd "C-u"))
(global-set-key (kbd "C-u") 'backward-word)

;; Uppercase word
(global-set-key (kbd "C-c u") 'upcase-word)

;; Yank
(global-unset-key (kbd "C-v"))
(global-unset-key (kbd "C-y"))
(global-set-key (kbd "C-v") 'yank)
(global-set-key (kbd "C-y") 'scroll-up-command)

(global-set-key (kbd "C-x C-b") 'electric-buffer-list)

;; Undo
(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-z") 'undo)

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

(defvar newline-and-indent t)

;; open new line (vi's o command)
(defun open-next-line ()
  (interactive)
  (end-of-line)
  (open-line 1)
  (next-line 1)
  (when newline-and-indent
    (indent-according-to-mode)))
(global-set-key (kbd "M-o") 'open-next-line)

;; Behave like vi's O command
(defun open-previous-line (arg)
  "Open a new line before the current one. See also `newline-and-indent'."
  (interactive "p")
  (beginning-of-line)
  (open-line arg)
  (when newline-and-indent
    (indent-according-to-mode)))
(global-set-key (kbd "C-c o") 'open-previous-line)


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

(defun my-kill-emacs-with-save ()
  (interactive)
  (save-buffers-kill-terminal "y")
)

(global-unset-key [tab])
(global-set-key [tab] 'tab-indent-or-complete)
(global-set-key (kbd "<backtab>") 'tab-indent-or-complete)

(global-set-key (kbd "C-c b") 'revert-buffer)


;; reload emacs configuration
(defun reload-init-file ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(global-set-key (kbd "C-c r") 'reload-init-file) 

(provide 'my_keybindings)
