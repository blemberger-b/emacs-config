(require 'package)
(setq package-enable-at-startup nil) ;Setting package-enable-at-startup var to nil
;; Add melpa to package provider list
(add-to-list 'package-archives
       '("melpa" . "https://melpa.org/packages/"))

;; Add melpa stable to package provider list
(add-to-list 'package-archives
       '("melpa-stable" . "https://stable.melpa.org/packages/"))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; BSL - Using logic inspired by SystemCrafters to refresh packages only when they are
;; not found locally.
(unless package-archive-contents
  (package-refresh-contents))

;; BSL - added this expression to install use-package package if its not
;; installed. See https://github.com/jwiegley/use-package.
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
;; Make sure use-package always installs packages if they are not installed
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; BSL - install tomorrow-theme if not installed
(unless (package-installed-p 'color-theme-sanityinc-tomorrow)
  (package-install 'color-theme-sanityinc-tomorrow))

;; BSL - use org-babel to source my config.org file for further configurations
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes '(sanityinc-tomorrow-blue))
 '(custom-safe-themes
   '("82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" default))
 '(hl-todo-keyword-faces
   '(("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#4f97d7")
     ("OKAY" . "#4f97d7")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f")))
 '(package-selected-packages
   '(org-bullets pcre2el plantuml-mode general smex with-editor elisp-refs page-break-lines org-tree-slide projectile yaml-mode beacon markdown-mode transient async clojure-mode dash golden-ratio-scroll-screen magit gnu-elpa-keyring-update htmlize mwim goto-last-change popup-kill-ring diminish spaceline company rainbow-delimiters presentation sudo-edit paredit cider which-key use-package))
 '(pdf-view-midnight-colors '("#b2b2b2" . "#292b2e")))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((type ns)) (:inherit nil :height 160 :foundry "nil" :family "Fira Code"))))
 '(dashboard-items-face ((t (:inherit widget-button :underline nil))))
 '(ediff-current-diff-A ((t (:extend t :background "#003f8e" :foreground "#7285b7"))))
 '(ediff-current-diff-B ((t (:extend t :background "#003f8e" :foreground "#7285b7"))))
 '(font-lock-comment-face ((((type tty)) (:foreground "grey"))))
 '(minibuffer-prompt ((t (:foreground "white" :weight bold))))
 '(mode-line ((((type tty)) (:background "white" :foreground "magenta" :inverse-video t :weight bold))))
 '(mode-line-inactive ((((type tty)) (:inherit mode-line :background "black" :foreground "green"))))
 '(org-ellipsis ((((type tty)) (:foreground "LightGoldenrod"))))
 '(powerline-active1 ((((type tty)) (:inherit mode-line))))
 '(powerline-active2 ((((type tty)) (:inherit mode-line))))
 '(powerline-inactive1 ((((type tty)) (:inherit mode-line-inactive :background "black"))))
 '(powerline-inactive2 ((((type tty)) (:inherit mode-line-inactive :background "black"))))
 '(show-paren-match ((((type tty)) (:background "blue" :foreground "white"))))
 '(spaceline-highlight-face ((((type tty)) (:inherit 'mode-line)))))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
