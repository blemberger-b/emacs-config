;; BSL - requiring "package" ns (I think).
(require 'package)
(setq package-enable-at-startup nil) ;Setting package-enable-at-startup var to nil
;; BSL - Add melpa to package provider list
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; BSL - added this expression to install use-package package if its not
;; installed.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; BSL - install spacemacs-theme if not installed
;; when I did this spacemacs-theme was not yet available from melpa stable
(unless (package-installed-p 'spacemacs-theme)
  (package-refresh-contents)
  (package-install 'spacemacs-theme))

;; BSL - Use use-package to add which-keys package
(use-package which-key
  :ensure t
  :init (which-key-mode))
;; BSL - Install & use markdown-mode (from MELPA)
;;   requires 'markdown' command installed in PATH
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "/usr/local/bin/markdown"))

;; BSL - my UI customizations
(tool-bar-mode -1) ; turn off graphical tool-bar
(scroll-bar-mode -1) ; turn off right scroll-bar
(menu-bar-mode -1) ; turn off top menu bar (in tty mode only)
(global-display-line-numbers-mode) ; turn on line numbering in all buffers that support it
(show-paren-mode 1) ; turn on parenthesis matching mode
;; turn on line highlight mode only in GUI mode
(when window-system (global-hl-line-mode))
 
;; BSL - set some global variables
(setq inhibit-startup-message t) ; turn off emacs start screen
;; Set geometry of all emacs frames
(setq default-frame-alist '((width . 120) (height . 50)))
;; Turn off aggressive vertical scrolling
(setq scroll-conservatively 100)
;; Turn off annoying bell
(setq ring-bell-function 'ignore)
;; Turn off autosaving
(setq auto-save-default nil)
;; Turn off stupid auto-backups
(setq make-backup-files nil)

;; BSL - remap Mac Fn key to super key (s- )
;; only works in GUI mode, because iTerm/console don't allow remapping Fn key
(setq mac-function-modifier 'super)

;; BSL - replace 'yes-or-no' prompts everywhere with 'y-or-n' prompts
(defalias 'yes-or-no-p 'y-or-n-p)

;; BSL - make bash the default shell for ansi-term
(defvar my-term-shell "/bin/bash")
(defadvice ansi-term (before force-bash)
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)

;; BSL - set a keyboard binding for ansi-term command to Command-Enter on Mac
(global-set-key (kbd "s-t") 'ansi-term)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (spacemacs-dark)))
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(package-selected-packages (quote (which-key use-package))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :height 140 :foundry "nil" :family "Monaco"))))
 '(minibuffer-prompt ((t (:foreground "white" :weight bold)))))
