;; Add MELPA to package list and initiatilize
(require 'package)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; Windows settings
;; (when (eq system-type 'windows-nt)
;;   (w32-register-hot-key [M-tab]))

;; load my themes
(use-package base16-theme
  :ensure t
  :config
  (load-theme 'base16-ashes t))

;; load magit
(use-package magit
  :ensure t)

;;install and configure ivy
(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (global-set-key (kbd "C-s") 'swiper-isearch)
  (global-set-key (kbd "C-c C-r") 'ivy-resume))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (ivy magit use-package base16-theme)))
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Courier New" :foundry "outline" :slant normal :weight normal :height 100 :width normal)))))
