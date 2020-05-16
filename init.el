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

;; Install smex package to do interactive prompting at M-x prompt
(unless (package-installed-p 'smex)
  (package-refresh-contents)
  (package-install 'smex))

;; BSL - use org-babel to source my config.org file for further configurations
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

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
 '(package-selected-packages (quote (avy ido-vertical-mode which-key use-package))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :height 140 :foundry "nil" :family "Monaco"))))
 '(minibuffer-prompt ((t (:foreground "white" :weight bold)))))