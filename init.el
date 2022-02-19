;; Vanilla variables configuration
(setq inhibit-startup-message t)


;; Vanilla global modes configuration

(tool-bar-mode -1)
(scroll-bar-mode -1)


(global-display-line-numbers-mode 1)

;; Disable line numbers on certain modes
(dolist (mode '(shell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(global-hl-line-mode 1)
(column-number-mode 1)


;; Backup files directory
(setq backup-directory-alist
          `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))


;; Theme and appearance configuration
(load-theme 'modus-vivendi t)

(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)

(set-face-attribute 'default nil :height 170)

(set-frame-parameter (selected-frame) 'alpha '(92 85))
(add-to-list 'default-frame-alist '(alpha 92 85))

(setq modus-themes-paren-match '(bold intense))

(add-hook 'window-setup-hook 'toggle-frame-maximized t)


;; Global keybindings change
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)


;; Package loader configuration
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))


;; Installing use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))


;; use-package configuration
(require 'use-package)

(setq use-package-always-ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(magit counsel-projectile projectile ivy use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; Appearance packages

(use-package diminish)

(use-package doom-modeline
  :diminish
  :config
  (doom-modeline-mode)
  (unless (package-installed-p 'doom-modeline)
    (all-the-icons-install-fonts t)))

(use-package rainbow-delimiters
  :diminish
  :hook (prog-mode . rainbow-delimiters-mode))

;; Documentation

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind (([remap describe-function] . counsel-describe-funtion)
	 ([remap describe-variable] . counsel-describe-variable)
	 ([remap describe-key] . #'helpful-key)))


;; Command auto-completion

(use-package ivy
  :diminish
  :config
  (ivy-mode))

(use-package counsel
  :diminish
  :config
  (counsel-mode))

(use-package ivy-rich
  :diminish
  :after counsel
  :config
  (ivy-rich-mode 1))

(use-package which-key
  :diminish
  :config
  (which-key-mode))

;; Project management

(use-package projectile
  :diminish
  :bind-keymap (("C-c p" . projectile-command-map))
  :config
  (projectile-mode))

(use-package counsel-projectile
  :diminish
  :after projectile
  :config
  (counsel-projectile-mode))

(use-package magit)

