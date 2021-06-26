(require 'package)
(setq package-enable-at-startup nil) ;Setting package-enable-at-startup var to nil
;; Add melpa to package provider list
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

;; Turn off key signature checking (KINDA DANGEROUS?)
(setq package-check-signature nil)

;; Add melpa stable to package provider list
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/"))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; BSL - added this expression to install use-package package if its not
;; installed. See https://github.com/jwiegley/use-package.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; BSL - install spacemacs-theme if not installed
;; when I did this spacemacs-theme was not yet available from melpa stable
(unless (package-installed-p 'spacemacs-theme)
  (package-refresh-contents)
  (package-install 'spacemacs-theme))

;; BSL - use org-babel to source my config.org file for further configurations
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
	[default default default italic underline success warning error])
 '(custom-enabled-themes '(spacemacs-dark))
 '(custom-safe-themes
	'("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default))
 '(package-selected-packages
	'(magit gnu-elpa-keyring-update htmlize mwim geiser goto-last-change popup-kill-ring diminish spaceline company rainbow-delimiters presentation sudo-edit paredit cider avy ido-vertical-mode which-key use-package))
 '(paradox-github-token t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(minibuffer-prompt ((t (:foreground "white" :weight bold))))
 
 ;; BSL - Mac only font definitions
 '(default ((((type ns)) (:inherit nil :height 140 :foundry "nil" :family "Monaco"))))

 ;; BSL - Console only font definitions
 '(font-lock-comment-face ((((type tty)) (:foreground "grey"))))
 '(mode-line ((((type tty)) (:background "white" :foreground "magenta" :inverse-video t :weight bold))))
 '(mode-line-inactive ((((type tty)) (:inherit mode-line :background "black" :foreground "green"))))
 '(powerline-active1 ((((type tty)) (:inherit mode-line))))
 '(powerline-active2 ((((type tty)) (:inherit mode-line))))
 '(powerline-inactive1 ((((type tty)) (:inherit mode-line-inactive :background "black"))))
 '(powerline-inactive2 ((((type tty)) (:inherit mode-line-inactive :background "black"))))
 '(show-paren-match ((((type tty)) (:background "blue" :foreground "white")))))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'scroll-left 'disabled nil)
