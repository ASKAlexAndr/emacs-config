;;(defun my-keybindings (my-key-map)
;;  (define-key my-key-map (kbd ("C-i") 'previous-line)
;;  (define-key my-key-map (kbd ("C-k") 'next-line)
;;  (define-key my-key-map (kbd ("C-j") 'backward-line)
;;  (define-key my-key-map (kbd ("C-l") 'forward-line)
;;)

(global-unset-key (kbd ("C-i"))
(global-set-key (kbd ("C-i") 'previous-line)
(global-unset-key (kbd ("C-k"))
(global-set-key (kbd ("C-k") 'next-line)
(global-unset-key (kbd ("C-j"))
(global-set-key (kbd ("C-j") 'backward-char)
(global-unset-key (kbd ("C-l"))
(global-set-key (kbd ("C-l") 'forward-char)
		     

		     
