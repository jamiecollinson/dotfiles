;; package.el setup (comes with emacs >= 24)

(require 'package)
(setq package-enable-at-startup nil) ;; prevents second package init
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Bootstrap `use-package'

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Config 3rd party packages

(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(use-package projectile
  :ensure t
  :config
  (projectile-mode))

(use-package helm
  :ensure t
  :bind (("M-x" . helm-M-x)
	 ("C-x b" . helm-buffers-list)
	 ("C-x C-f" . helm-find-files)))

(use-package helm-swoop
  :ensure t
  :bind (("M-i" . helm-swoop)
	 ("M-I" . helm-swoop-back-to-last-point)))

(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on))

(use-package avy
  :ensure t
  :bind ("C-;" . avy-goto-word-1))

(use-package smartparens
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'smartparens-mode))

(use-package flycheck
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-flycheck-mode))

(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package company-go
  :ensure t
  :config
  (add-to-list 'company-backends 'company-go))

(use-package helm-dash
  :ensure t)

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package rainbow-identifiers
  :ensure t)

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode)
	 ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package go-mode
  :ensure t
  :config
  (add-hook 'before-save-hook 'gofmt-before-save))

(use-package js2-mode
  :ensure t
  :mode "\\.js\\'")

(use-package rjsx-mode
  :ensure t)

(use-package prettier-js
  :load-path "private"
  :config
  (setq prettier-target-mode "js2-mode")
  (setq prettier-args '(
			"--trailing-comma" "es5"
			"--single-quote" "true"
			"--print-width" "150"
			))
  (add-hook 'js2-mode-hook
	    (lambda ()
	      (add-hook 'before-save-hook 'prettier-before-save)))
  (add-hook 'rjsx-mode-hook
	    (lambda ()
	      (add-hook 'before-save-hook 'prettier nil 'make-it-local))))

(use-package smooth-scrolling
  :ensure t
  :config
  (smooth-scrolling-mode 1))

(use-package all-the-icons
  :ensure t)

(use-package neotree
  :ensure t
  :config
  (global-set-key (kbd "C-c t") 'neotree-toggle)
  (setq neo-smart-open t)
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))

(use-package which-key
  :ensure t
  :config
  (add-hook 'after-init-hook 'which-key-mode))

(use-package aggressive-indent
  :ensure t
  :config
  (global-aggressive-indent-mode 1))

(use-package beacon
  :ensure t
  :config
  (beacon-mode 1))

(use-package ace-window
  :ensure t
  :bind ("C-'" . ace-window)
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

(use-package nyan-mode
  :ensure t)

(use-package zenburn-theme
  :ensure t)

(use-package dracula-theme
  :ensure t)

;; Non-package config

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

(load-theme 'dracula t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq ring-bell-function 'ignore) ;; Disable bell

;; Emacs sets the below - leave it alone!

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js-indent-level 2)
 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
