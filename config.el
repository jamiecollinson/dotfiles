
(use-package benchmark-init
  :ensure t
  :config
  ;; To disable collection of benchmark data after init is done.
  (add-hook 'after-init-hook 'benchmark-init/deactivate))

(defun find-config ()
  "Edit config.org"
  (interactive)
  (find-file "~/dotfiles/config.org"))

(global-set-key (kbd "C-c I") 'find-config)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(setq package-enable-at-startup nil)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq custom-file (make-temp-file "emacs-custom"))

(add-to-list 'load-path "~/.emacs.d/lisp/")

(setq inhibit-startup-screen t)

(setq mac-command-modifier 'meta
      mac-option-modifier 'none)

(global-visual-line-mode 1)

(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq ring-bell-function 'ignore)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )

(use-package crux
  :ensure t
  :bind (("C-a" . crux-move-beginning-of-line)))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(use-package use-package-chords
  :ensure t
  :config
  (key-chord-mode 1))

(defun jc/switch-to-previous-buffer ()
  "Switch to previously open buffer.
Repeated invocations toggle between the two most recently open buffers."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(key-chord-define-global "JJ" 'jc/switch-to-previous-buffer)

(use-package smex
  :ensure t)

(use-package ivy
    :ensure t
    :diminish ivy-mode
    :config
    (ivy-mode t))

(setq ivy-initial-inputs-alist nil)

(use-package counsel
  :ensure t
  :bind (("M-x" . counsel-M-x))
  :chords (("yy" . counsel-yank-pop)))

(use-package swiper
  :ensure t
  :bind (("M-s" . swiper)))

(use-package ivy-hydra
  :ensure t)

(use-package which-key
  :ensure t
  :diminish which-key-mode
  :config
  (add-hook 'after-init-hook 'which-key-mode))

(use-package undo-tree
  :ensure t
  :chords (("uu" . undo-tree-visualize))
  :diminish undo-tree-mode:
  :config
  (global-undo-tree-mode 1))

(use-package avy
  :ensure t
  :chords (("jj" . avy-goto-char-2)
           ("jl" . avy-goto-line)))

(use-package ace-window
   :ensure t
   :chords ("jk" . ace-window)
   :config
   (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))

(use-package neotree
  :ensure t
  :config
  (global-set-key (kbd "C-c t") 'neotree-toggle))

(setq neo-smart-open t)

(setq neo-theme 'arrow)

(use-package treemacs
  :ensure t)

(use-package dracula-theme
  :disabled
  :ensure t
  :config
  (load-theme 'dracula t))

(use-package apropospriate-theme
  :ensure t)

(use-package panda-theme
  :ensure t
  :config
  (load-theme 'panda t))

(set-frame-font "Operator Mono 12" nil t)

(set-fontset-font t 'unicode "STIXGeneral" nil 'prepend)

(setq prettify-symbols-unprettify-at-point 'right-edge)
(global-prettify-symbols-mode 0)

(add-hook
 'python-mode-hook
 (lambda ()
   (mapc (lambda (pair) (push pair prettify-symbols-alist))
         '(("def" . "𝒇")
           ("class" . "𝑪")
           ("and" . "∧")
           ("or" . "∨")
           ("not" . "￢")
           ("in" . "∈")
           ("not in" . "∉")
           ("return" . "⟼")
           ("yield" . "⟻")
           ("for" . "∀")
           ("!=" . "≠")
           ("==" . "＝")
           (">=" . "≥")
           ("<=" . "≤")
           ("[]" . "⃞")
           ("=" . "≝")))))

(use-package powerline
  :disabled
  :ensure t
  :config
  (setq powerline-default-separator 'utf-8))

(use-package feebleline
  :ensure t)

(use-package emojify
  :ensure t)

(use-package focus
  :ensure t)

(use-package nyan-mode
    :ensure t)

(global-hl-line-mode 1)

(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :config
  (add-hook 'prog-mode-hook 'smartparens-mode))

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package rainbow-mode
  :ensure t
  :config
  (setq rainbow-x-colors nil)
  (add-hook 'prog-mode-hook 'rainbow-mode))

(use-package aggressive-indent
    :ensure t)

(add-hook 'prog-mode-hook 'electric-pair-mode)

(use-package smart-dash
  :ensure t
  :config
  (add-hook 'python-mode-hook 'smart-dash-mode))

(use-package projectile
  :ensure t
  :config
  (projectile-mode))

(setq projectile-completion-system 'ivy)

(use-package counsel-projectile
  :ensure t
  :config
  (add-hook 'after-init-hook 'counsel-projectile-mode))

(use-package fzf
  :ensure t)

(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(use-package dumb-jump
  :ensure t
  :diminish dumb-jump-mode
  :bind (("C-M-g" . dumb-jump-go)
         ("C-M-p" . dumb-jump-back)
         ("C-M-q" . dumb-jump-quick-look)))

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

(use-package git-gutter
  :ensure t
  :config
  (global-git-gutter-mode 't)
  :diminish git-gutter-mode)

(use-package git-timemachine
  :ensure t)

(use-package flycheck
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-flycheck-mode)
  (add-hook 'flycheck-mode-hook 'jc/use-eslint-from-node-modules)
  (add-to-list 'flycheck-checkers 'proselint)
  (setq-default flycheck-highlighting-mode 'lines)
  ;; Define fringe indicator / warning levels
  (define-fringe-bitmap 'flycheck-fringe-bitmap-ball
    (vector #b00000000
            #b00000000
            #b00000000
            #b00000000
            #b00000000
            #b00000000
            #b00000000
            #b00011100
            #b00111110
            #b00111110
            #b00111110
            #b00011100
            #b00000000
            #b00000000
            #b00000000
            #b00000000
            #b00000000))
  (flycheck-define-error-level 'error
    :severity 2
    :overlay-category 'flycheck-error-overlay
    :fringe-bitmap 'flycheck-fringe-bitmap-ball
    :fringe-face 'flycheck-fringe-error)
  (flycheck-define-error-level 'warning
    :severity 1
    :overlay-category 'flycheck-warning-overlay
    :fringe-bitmap 'flycheck-fringe-bitmap-ball
    :fringe-face 'flycheck-fringe-warning)
  (flycheck-define-error-level 'info
    :severity 0
    :overlay-category 'flycheck-info-overlay
    :fringe-bitmap 'flycheck-fringe-bitmap-ball
    :fringe-face 'flycheck-fringe-info))

(flycheck-define-checker proselint
  "A linter for prose."
  :command ("proselint" source-inplace)
  :error-patterns
  ((warning line-start (file-name) ":" line ":" column ": "
            (id (one-or-more (not (any " "))))
            (message (one-or-more not-newline)
                     (zero-or-more "\n" (any " ") (one-or-more not-newline)))
            line-end))
  :modes (text-mode markdown-mode gfm-mode org-mode))

(use-package company
  :ensure t
  :diminish
  :config
  (add-hook 'after-init-hook 'global-company-mode)

  (setq company-idle-delay t)

  (use-package company-go
    :ensure t
    :config
    (add-to-list 'company-backends 'company-go))

  (use-package company-anaconda
    :ensure t
    :config
    (add-to-list 'company-backends 'company-anaconda)))

(setq company-dabbrev-downcase nil)

(use-package yasnippet
    :ensure t
    :diminish yas-minor-mode
    :config
    (add-to-list 'yas-snippet-dirs "~/.emacs.d/yasnippet-snippets")
    (add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets")
    (yas-global-mode)
    (global-set-key (kbd "M-/") 'company-yasnippet))

(setq-default js-indent-level 2)

(use-package js2-mode
  :ensure t
  :mode "\\.js\\'"
  :config
  (setq-default js2-ignored-warnings '("msg.extra.trailing.comma")))

(use-package js2-refactor
  :ensure t
  :config
  (js2r-add-keybindings-with-prefix "C-c C-m")
  (add-hook 'js2-mode-hook 'js2-refactor-mode))

(use-package rjsx-mode
  :ensure t)

(use-package prettier-js
  :ensure t
  :config
  (setq prettier-js-args '(
                        "--trailing-comma" "es5"
                        "--single-quote" "true"
                        "--print-width" "100"
                        ))
  (add-hook 'js2-mode-hook 'prettier-js-mode)
  (add-hook 'rjsx-mode-hook 'prettier-js-mode))

(use-package js-doc
  :ensure t
  :bind (:map js2-mode-map
         ("C-c i" . js-doc-insert-function-doc)
         ("@" . js-doc-insert-tag))
  :config
  (setq js-doc-mail-address "jamiecollinson@gmail.com"
       js-doc-author (format "Jamie Collinson <%s>" js-doc-mail-address)
       js-doc-url "jamiecollinson.com"
       js-doc-license "MIT License"))

(defun jc/use-eslint-from-node-modules ()
  "Set local eslint if available."
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/eslint/bin/eslint.js"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))

(use-package web-mode
  :ensure t
  :mode ("\\.html\\'")
  :config
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-engines-alist
        '(("django" . "focus/.*\\.html\\'")
          ("ctemplate" . "realtimecrm/.*\\.html\\'"))))

(use-package web-beautify
  :ensure t
  :bind (:map web-mode-map
         ("C-c b" . web-beautify-html)
         :map js2-mode-map
         ("C-c b" . web-beautify-js)))

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
  (add-hook 'before-save-hook 'gofmt-before-save)

  (use-package go-eldoc
    :ensure t
    :config
    (add-hook 'go-mode-hook 'go-eldoc-setup))

  (use-package godoctor
    :ensure t)

  (use-package go-guru
    :ensure t))

(defun jc/go-guru-set-current-package-as-main ()
  "GoGuru requires the scope to be set to a go package which
   contains a main, this function will make the current package the
   active go guru scope, assuming it contains a main"
  (interactive)
  (let* ((filename (buffer-file-name))
         (gopath-src-path (concat (file-name-as-directory (go-guess-gopath)) "src"))
         (relative-package-path (directory-file-name (file-name-directory (file-relative-name filename gopath-src-path)))))
    (setq go-guru-scope relative-package-path)))

(use-package haskell-mode
  :ensure t)

(use-package hindent
  :ensure t)

(use-package ghc
  :ensure t
  :config
  (add-hook 'haskell-mode-hook (lambda () (ghc-init))))

(use-package company-ghc
  :ensure t
  :config
  (add-to-list 'company-backends 'company-ghc))

(use-package anaconda-mode
  :ensure t
  :config
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode))

(use-package kivy-mode
  :ensure t
  :mode ("\\.kv\\'" . kivy-mode))

(use-package elixir-mode
  :ensure t
  :config

  (use-package alchemist
    :ensure t))

(use-package feature-mode
  :ensure t)

(use-package rebol)

(use-package idris-mode
  :ensure t)

(require 'proof-site "~/.emacs.d/lisp/PG/generic/proof-site")

(use-package company-coq
  :ensure t
  :hook (coq-mode . company-coq-mode))

(use-package elm-mode
  :ensure t
  :config
  (setq elm-format-on-save t)
  (add-to-list 'company-backends 'company-elm))

(use-package irony
  :ensure t
  :hook (c-mode . irony-mode))

(use-package company-irony
  :ensure t
  :config
  (add-to-list 'company-backends 'company-irony))

(use-package flycheck-irony
  :ensure t
  :hook (flycheck-mode . flycheck-irony-setup))

(use-package csharp-mode
  :ensure t)

(use-package omnisharp
  :ensure t
  :hook ((csharp-mode . omnisharp-mode)
         ;; TODO: 'before-save runs globally - make this buffer local?
         (before-save . omnisharp-code-format-entire-file))
  :config
  (add-to-list 'company-backends 'company-omnisharp))

(use-package fsharp-mode
  :ensure t)

(setq org-startup-indented 'f)
(setq org-directory "~/org")
(setq org-special-ctrl-a/e 't)
(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cc" 'org-capture)
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
(setq org-src-fontify-natively 't)
(setq org-src-tab-acts-natively t)
(setq org-src-window-setup 'current-window)

(use-package org-bullets
  :ensure t
  :config
  (setq org-bullets-bullet-list '("∙"))
  (add-hook 'org-mode-hook 'org-bullets-mode))

(let*
    ((variable-tuple (cond
                      ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
                      ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
                      ((x-list-fonts "Verdana")         '(:font "Verdana"))
                      ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
                      (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
     (base-font-color     (face-foreground 'default nil 'default))
     (headline           `(:inherit default :weight normal :foreground ,base-font-color)))

  (custom-theme-set-faces 'user
                          `(org-level-8 ((t (,@headline ,@variable-tuple))))
                          `(org-level-7 ((t (,@headline ,@variable-tuple))))
                          `(org-level-6 ((t (,@headline ,@variable-tuple))))
                          `(org-level-5 ((t (,@headline ,@variable-tuple))))
                          `(org-level-4 ((t (,@headline ,@variable-tuple))))
                          `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.33))))
                          `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.33))))
                          `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.33 ))))
                          `(org-document-title ((t (,@headline ,@variable-tuple :height 1.33 :underline nil))))))

(use-package ox-twbs
  :ensure t)

(use-package writegood-mode
  :ensure t
  :bind ("C-c g" . writegood-mode)
  :config
  (add-to-list 'writegood-weasel-words "actionable"))

(use-package sx
  :ensure t
  :config
  (bind-keys :prefix "C-c s"
             :prefix-map my-sx-map
             :prefix-docstring "Global keymap for SX."
             ("q" . sx-tab-all-questions)
             ("i" . sx-inbox)
             ("o" . sx-open-link)
             ("u" . sx-tab-unanswered-my-tags)
             ("a" . sx-ask)
             ("s" . sx-search)))

(use-package w3m
  :ensure t)

(use-package notmuch
  :ensure t)

(use-package restclient
  :ensure t)

(use-package slack
  :ensure t
  :commands (slack-start))

(use-package google-this
  :ensure t)
