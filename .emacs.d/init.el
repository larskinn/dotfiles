;; Requirements
(require 'package)

;;; ======================
;;; Package manager config
;;; ======================
(setq package-list '(clojure-mode paredit rainbow-delimiters
		     markdown-mode adaptive-wrap lineno))
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)
;; fetch list of available packages
(when (not package-archive-contents)
  (package-refresh-contents))
; install the missing packages
(dolist (package package-list)
  (when (not (package-installed-p package))
    (package-install package)))

;;; ===============
;;; Global settings
;;; ===============

;; Backup files
(defvar backup-dir "~/.emacs-saves")
(make-directory backup-dir t) ; create dir if it doesn't exist
(setq backup-directory-alist `(("." . ,backup-dir)))

;; Color and highlight parens
(global-rainbow-delimiters-mode)
(show-paren-mode)

;; OS X-specific key bindings
(if (eq window-system 'ns) ;ns for Nextstep
  (progn
    (setq mac-command-modifier 'meta)
    (setq mac-control-modifier 'control)
    (setq mac-option-modifier nil)))

;; Interface options
(line-number-mode)
(global-linum-mode)
(column-number-mode)
(load-theme 'wombat)

;; Word wrap
(global-visual-line-mode)

;;; ======================
;;; Mode-specific settings
;;; ======================

;;; Text
;;; ----
(add-hook 'text-mode-hook 'adaptive-wrap-prefix-mode)

;;; Markdown
;;; --------
(add-hook 'markdown-mode-hook 'adaptive-wrap-prefix-mode)

;;; Clojure
;;; -------
(add-hook 'clojure-mode-hook 'paredit-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
