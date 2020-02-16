;; Add MELPA to package list and initiatilize
(require 'package)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; load my themes
(use-package base16-theme
  :ensure t
  :config
  (load-theme 'base16-ashes t))

;; markdown mode
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;; load magit
(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

;;install and configure ivy
(use-package ivy
  :ensure t
  :config
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t))

;; load swiper
(use-package swiper
  :ensure t
  :config
  (ivy-mode 1)
  (global-set-key "\C-s" 'swiper)
  (global-set-key (kbd "C-c C-r") 'ivy-resume))

;; set counsel
(use-package counsel
  :ensure t
  :config
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-c C-f") 'counsel-find-file))


;; setup geiser for scheme
(use-package geiser
  :ensure t
  :config
  (setq geiser-racket-binary "C:/Users/jgoth/Software/Racket/Racket.exe"))

;; Load yasnippet
(use-package yasnippet
  :ensure t
  :init)

;; Javascript environment
(use-package js2-mode
  :ensure t
  :init
  :mode "\\.js\\'"
  :config
  (setq js-basic-indent 2)
  (use-package js2-refactor :ensure t))

;;(use-package xref-js2 :ensure t :init)


;; ~ is wierd on windows, so start in c:/Users/jgoth
(setq default-directory "C:/Users/jgoth")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (yasnippet js2-mode counsel swiper geiser slime ivy magit use-package base16-theme)))
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Courier New" :foundry "outline" :slant normal :weight normal :height 100 :width normal)))))
