(require 'package)
(add-to-list 'package-archives
  '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(company
    subatomic-theme
    parinfer-rust-mode
    rainbow-delimiters))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(setq make-backup-files nil)
(setq auto-save-default nil)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(show-paren-mode 1)

(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook
  (lambda () (load-theme 'subatomic t)))

(add-hook 'scheme-mode-hook 'parinfer-rust-mode)
(add-hook 'scheme-mode-hook 'rainbow-delimiters-mode)

(keyboard-translate ?\C-t ?\C-x)
(keyboard-translate ?\C-x ?\C-t)
