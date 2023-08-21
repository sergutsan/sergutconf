(set-foreground-color "grey")
(set-background-color "black")
(set-cursor-color     "red")

(add-hook 'text-mode-hook 'auto-fill-mode)

(transient-mark-mode 1)

(setq backup-directory-alist '(("." . "~/.emacs_backups")))
