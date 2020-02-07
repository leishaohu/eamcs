;; cl - Common Lisp Extension
(require 'cl)

(when (>= emacs-major-version 24)
     ;;(require 'package)   
     (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
     )

;; Add Packages
 (defvar my/packages '(
		;; --- Auto-completion ---
		company
		;; --- Better Editor ---
		hungry-delete
		swiper
		counsel
		smartparens
	 	;; --- Major Mode ---
		js2-mode
		;; --- Minor Mode ---
		nodejs-repl
		exec-path-from-shell
		;; --- Themes ---
		monokai-theme
	        solarized-theme
		) "Default packages")

(setq package-selected-packages my/packages)


(defun my/packages-installed-p ()
     (loop for pkg in my/packages
	   when (not (package-installed-p pkg)) do (return nil)
	   finally (return t)))
(unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
	 (package-install pkg))))
;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;;饥饿删除
(require 'hungry-delete)
(global-hungry-delete-mode)

;; 聪明括号设置
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

;;针对 swiper的配置
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)

;;主题
(add-to-list 'my/packages 'solarized-theme)
(load-theme 'solarized-dark t)


(provide 'init-packages)
