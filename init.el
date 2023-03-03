(load "~/.emacs.d/install.el")

(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
)

(require 'org)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done t)

(global-set-key (kbd "C-d") 'duplicate-line)
(global-set-key (kbd "<delete>") 'delete-char)

(global-unset-key (kbd "C-x C-c"))
;; Rust
(setq rust-format-on-save t)

;; define function to shutdown emacs server instance
(defun server-shutdown ()
  "Save buffers, Quit, and Shutdown (kill) server"
  (interactive)
  (save-some-buffers)
  (kill-emacs))

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(add-to-list 'auto-mode-alist '("\\.pde\\'" . java-mode))

(savehist-mode 1)
(setq history-delete-duplicates t)
(setq eshell-hist-ignoredups t)

(global-auto-revert-mode 1)
(global-subword-mode 1)

(setq-default c-basic-offset 4
              c-default-style "linux"
              tab-width 4
              indent-tabs-mode nil
              c-set-offset 'case-label +)

(add-hook 'compilation-mode-hook 'toggle-truncate-lines)

(setq dired-listing-switches "-alh")

;; Auto-refresh dired on file change
(add-hook 'dired-mode-hook 'auto-revert-mode)

(projectile-global-mode)
(setq projectile-project-search-path '("~/src/" "~/Documents/"))
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(global-set-key (kbd "M-<right>") 'windmove-right)
(global-set-key (kbd "M-<left>") 'windmove-left)
(global-set-key (kbd "M-<up>") 'windmove-up)
(global-set-key (kbd "M-<down>") 'windmove-down)

; smart tabs
;(smart-tabs-insinuate 'c 'c++ 'java)

; line numbering
(setq linum-format "%4d \u2502 ")
(add-hook 'c++-mode-hook 'linum-mode)
(add-hook 'c-mode-hook 'linum-mode)
(add-hook 'java-mode-hook 'linum-mode)
(add-hook 'emacs-lisp-mode-hook 'linum-mode)
(add-hook 'feature-mode-hook 'linum-mode)

(add-to-list 'auto-mode-alist '("\\.model\\'" . java-mode))
(add-to-list 'auto-mode-alist '("\\.xtend\\'" . java-mode))

(load "~/.emacs.d/themes/inkpot-theme-20170709.1858.el")
(load "~/.emacs.d/specific.el" 'missing-ok)

(desktop-save-mode t) ; does not work with server mode

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compilation-scroll-output (quote first-error))
 '(grep-find-ignored-directories
	 (quote
		("SCCS" "RCS" "CVS" "MCVS" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "_doc_" "_build_" "_build_gen_" "_build_debug_native_" "_build_*" "build-output")))
 '(magit-log-arguments (quote ("--graph" "--color" "--decorate" "-n256")))
 '(scheme-program-name "guile")
 '(shell-file-name "/bin/bash")
;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
; )
