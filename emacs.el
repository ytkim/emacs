;; 
;; youngtae.kim@gmail.com
;;

;; load path
(add-to-list 'load-path "~/.emacs.d/")


(menu-bar-mode -1)
(tool-bar-mode -1)

(when (require 'ido nil t)
  (setq ido-enable-flex-matching t)
  (setq ido-everywhere t)
  (add-to-list 'ido-ignore-directories "\\`trace/")
  (ido-mode 1) ;; buffer change
)

(setq make-backup-files nil)

;; global key mapping
(global-set-key (kbd "C-?") 'help-command)
(global-set-key (kbd "<f1>") 'help-command)
(global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)
(global-set-key (kbd "C-c l") 'goto-line)

(global-set-key (kbd "<f2>") 'recompile)
(global-set-key (kbd "<f3>") 'previous-error)
(global-set-key (kbd "<f4>") 'next-error)
(global-set-key (kbd "<f5>") 'compile)

;; default indentation
(setq-default tab-width        4
              indent-tabs-mode nil)

;; 
;; c-mode
;; 
(setq-default c-default-style  "linux"
              c-basic-offset   4)

;; 
;; python-mode
;; 
;; (add-hook 'python-mode-hook 'guess-style-guess-tabs-mode)
(add-hook 'python-mode-hook
          (lambda ()
            (local-set-key (kbd "RET") 'newline-and-indent)
            (setq indent-tabs-mode nil)
            (setq tab-width 4)
            (setq python-indent 4)))

;; 
;; emacs-lisp-mode
;; 
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            ;; Use spaces, not tabs.
            (setq indent-tabs-mode nil)
            ;; Keep M-TAB for `completion-at-point'
            ;; (define-key flyspell-mode-map "\M-\t" nil)
            ;; Pretty-print eval'd expressions.
            (define-key emacs-lisp-mode-map
              "\C-x\C-e" 'pp-eval-last-sexp)
            ;; Recompile if .elc exists.
            (add-hook (make-local-variable 'after-save-hook)
                      (lambda ()
                        (byte-force-recompile default-directory)))
            (define-key emacs-lisp-mode-map
              "\r" 'reindent-then-newline-and-indent)))
