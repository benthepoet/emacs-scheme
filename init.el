(require 'package)
(add-to-list 'package-archives
  '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(aggressive-indent
    company
    cyberpunk-theme
    paredit
    rainbow-delimiters))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(setq make-backup-files nil)
(setq auto-save-default nil)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook
  (lambda () (load-theme 'cyberpunk t)))

(add-hook 'scheme-mode-hook 'aggressive-indent-mode)
(add-hook 'scheme-mode-hook 'paredit-mode)
(add-hook 'scheme-mode-hook 'rainbow-delimiters-mode)

(keyboard-translate ?\C-t ?\C-x)
(keyboard-translate ?\C-x ?\C-t)