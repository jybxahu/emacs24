(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'load-path "~/.emacs.d/site-lisp/")
;;; Support for the elisp library elib.
(add-to-list 'load-path "/usr/local/share/emacs/site-list/elib")
(add-to-list 'load-path "~/.emacs.d/jdee-2.4.1/lisp")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode 1)
 '(default-tab-width 4 t)
 '(delete-selection-mode 1)
 '(global-linum-mode 1)
 '(ido-mode 1 nil (ido))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(interprogram-paste-function (quote x-cut-buffer-or-selection-value) t)
 '(jde-global-classpath (quote ("/home/local/ANT/yiboj/AppFiles/JAVA/" "/workspace/yiboj/" "/usr/lib/jvm/java-7-openjdk-amd64/")))
 '(jde-jdk (quote ("1.7")))
 '(jde-jdk-registry (quote (("1.7" . "/usr/lib/jvm/java-7-openjdk-amd64") ("1.7.0_55" . "/usr/lib/jvm/java-1.7.0-openjdk-amd64"))))
 '(make-backup-files nil)
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/") ("melpa" . "http://melpa.milkbox.net/packages/") ("marmalade" . "http://marmalade-repo.org/packages/"))))
 '(show-paren-mode 1))
(windmove-default-keybindings)
(defalias 'xml-mode 'nxml-mode)
(defalias 'yes-or-no-p 'y-or-n-p)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-hook 'find-file-hooks '(lambda ()
                              (setq mode-line-buffer-identification 'buffer-file-truename)))

(package-initialize)
(require 'color-theme)
(setq color-theme-is-global t)
(color-theme-initialize)
(color-theme-solarized-dark)

;; set the connect  for mysql 
(load "mysql-conf")

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20140208.653/dict")
(set-default 'ac-sources
             '(ac-source-abbrev
               ac-source-dictionary
               ac-source-yasnippet
               ac-source-words-in-buffer
               ac-source-words-in-same-mode-buffers
               ac-source-semantic))
 
(ac-config-default)
(dolist (m '(c-mode c++-mode java-mode))
(add-to-list 'ac-modes m))
(global-auto-complete-mode t)

(require 'yasnippet)
(yas-global-mode 1)
(elpy-enable)

(require 'magit)
(require 'jabber-autoloads)
(load "jabber-conf")
(require 'xclip)
(turn-on-xclip)

;;;JAVA Development Environment
(autoload 'jde-mode "jde" "JDE mode." t)
(setq auto-mode-alist 
	(append
		'(("\\.java\\'" . jde-mode))
		auto-mode-alist))
;;(load "jde")
;;;Auto-Complete for JAVA
(add-to-list 'ac-modes 'jde-mode)
(require 'ajc-java-complete-config)
(add-hook 'java-mode-hook 'ajc-java-complete-mode)
(add-hook 'find-file-hook 'ajc-4-jsp-find-file-hook)

;;; provide tags support for c, c++ and java
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))

;; add paredit support of clojure mode
(add-hook 'clojure-mode-hook 'paredit-mode)
