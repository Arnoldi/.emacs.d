(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)


; list the required packages
(setq package-list
			'(smart-tabs-mode smart-yank rust-mode geiser projectile feature-mode))

; activate all the packages
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))


;(add-to-list 'load-path "/path/to/rust-mode/")
;(autoload 'rust-mode "rust-mode" nil t)
;(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
