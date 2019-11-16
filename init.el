;; System-type definition
(defun system-is-linux()
  (string-equal system-type "gnu/linux"))
(defun system-is-windows()
  (string-equal system-type "windows-nt"))

;; My name and e-mail adress
(setq user-full-name   "Alexandr Korotkov")
(setq user-mail-adress "ask.97.alexandr@gmail.com")

;; Electric-modes settings
(electric-pair-mode    1) ;; autoclose {},[],()
(electric-indent-mode -1) ;; autotab

;; Backups
(setq make-backup-files nil)

;; Line numbers
(global-display-line-numbers-mode)

;; reload emacs configuration
(defun reload-init-file ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(global-set-key (kbd "C-c r") 'reload-init-file) 

(load-file "~/.emacs.d/test/start.el")
;;(load-file "~/.emacs.d/test/keybindings.el")
