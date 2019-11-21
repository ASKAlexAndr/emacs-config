;; My name and e-mail adress
(setq-default  user-full-name   "Alexandr Korotkov"
               user-mail-adress "ask.97.alexandr@gmail.com")

;; Inhibit startup/splash screen
(setq inhibit-splash-screen   t
      inhibit-startup-message t)

;; Bar-modes
(menu-bar-mode 1)
(tool-bar-mode -1)

;; Save session
(desktop-save-mode 1)

;; Backups
(setq make-backup-files        nil) ;; backup files
(setq auto-save-list-file-mode nil) ;; .saves files
(setq auto-save-default        nil) ;; any autosaving

;; Short messages
(defalias 'yes-or-no-p 'y-or-n-p)

;; Electric-modes settings
(electric-pair-mode    1) ;; autoclose {},[],()
(electric-indent-mode -1) ;; autotab on RET

;; Delete selection
(delete-selection-mode t)

;; Indent settings
(setq-default indent-tabs-mode      nil
              tab-width             4
              tab-always-indent     nil
              c-basic-offset        2
              sh-basic-offset       2
              sh-indentation        2
              scala-basic-offset    2
              java-basic-offset     4
              standart-indent       4
              lisp-body-indent      2
              js-indent-level       2
              indent-line-function  'insert-tab)

;; Scrolling settings
(setq scroll-step             1
      scroll-margin           10
      scroll-conservatively   10000)

;; Coding-system settings
(set-language-environment               'UTF-8)
(setq buffer-file-coding-system         'utf-8
      file-name-coding-system           'utf-8)
(setq-default coding-system-for-read    'utf-8)
(set-selection-coding-system            'utf-8)
(set-keyboard-coding-system             'utf-8-unix)
(set-terminal-coding-system             'utf-8)
(prefer-coding-system                   'utf-8)

;; Line numbers
(global-display-line-numbers-mode)
(setq-default display-line-numbers t)

(setq split-height-threshold  nil
      split-width-threshold   0)

(if (equal nil (equal major-mode 'org-mode))
    (windmove-default-keybindings 'meta))

(recentf-mode 1)
(setq recentf-max-menu-items      150
      recentf-max-saved-items     550)

;; Show paren
(setq show-paren-delay 0
      show-paren-style 'expression)
(show-paren-mode 2)

(setq ns-pop-up-frames          nil
      ad-redefinition-action    'accept)

;;(if (fboundp 'global-font-lock-mode)
;;    (global-font-lock-mode -1))

;; Russian
(cl-loop
 for from across "йцукенгшщзхїфівапролджєячсмитьбюЙЦУКЕНГШЩЗХЇФІВАПРОЛДЖ\ЄЯЧСМИТЬБЮ№"
 for to   across "qwertyuiop[]asdfghjkl;'zxcvbnm,.QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>#"
 do
 (eval `(define-key local-function-key-map
          (kbd ,(concat "C-"
                        (string from)))
          (kbd ,(concat "C-"
                        (string to)))))
 (eval `(define-key local-function-key-map
          (kbd ,(concat "M-"
                        (string from)))
          (kbd ,(concat "M-"
                        (string to)))))
 (eval `(define-key local-function-key-map
          (kbd ,(string from))
          (kbd ,(string to)))))


(provide 'my_settings)
