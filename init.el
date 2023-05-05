;;
;; Package manager  setup
;; 

;; Install straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
	 'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Setup use-package to use straight.el
(setq package-enable-at-startup nil)
(straight-use-package 'use-package)
(setq use-package-always-ensure t)
(use-package straight
  :custom
  (straight-use-package-by-default t))

;;
;; Language Support
;;

;; Go
(use-package go-mode)
(add-hook 'go-mode-hook (lambda () (setq tab-width 4)))

;; Lisp
(use-package slime)
(setq inferior-lisp-program "sbcl")

;;
;; Utilities
;;

;; Helm
(use-package helm)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(helm-mode 1)

;; Version control stuff
(use-package magit)

;; Parens
(use-package rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Autocomplete
(use-package company)
(add-hook 'prog-mode-hook #'company-mode)

;; 
;; Look and feel
;;

;; Remove distraction
(tool-bar-mode -1)
;;(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-splash-screen t) 
(setq ring-bell-function 'ignore)
(defalias 'yes-or-no-p 'y-or-n-p)

;; Download Color Theme Modern
(use-package color-theme-modern)

;; Use railscast
(require 'color-theme-modern)
(load-theme 'railscast t t)
(enable-theme 'railscast)
