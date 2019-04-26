;; SuperCollider
;(add-to-list 'load-path "C:\Program Files\SuperCollider-3.8.0\sclang.exe")
;(require 'sclang)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(column-number-mode t)
 '(current-language-environment "UTF-8")
 '(custom-enabled-themes (quote (mine)))
 '(custom-safe-themes
   (quote
    ("a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "7d690aa1f65a4d87a4c70b737a7d6da45960670b6e4372260550c0808f6e74b0" default)))
 '(default-input-method "russian-computer")
 '(hl-sexp-background-color "#1c1f26")
 '(org-agenda-files
   (quote
    ("e:/paul/4d8c8994-70e4-4174-88e2-7bf59019245b/home/diary.org" "e:/paul/4d8c8994-70e4-4174-88e2-7bf59019245b/home/work/teaching/english/eng.org" "e:/paul/4d8c8994-70e4-4174-88e2-7bf59019245b/home/studying/6-й семестр/yspu.org" "e:/paul/4d8c8994-70e4-4174-88e2-7bf59019245b/home/work/teaching/js/js.org" "e:/paul/4d8c8994-70e4-4174-88e2-7bf59019245b/home/work/teaching/web/web.org" "e:/paul/4d8c8994-70e4-4174-88e2-7bf59019245b/home/notebook.org")))
 '(org-html-doctype "html5")
 '(package-selected-packages
   (quote
    (ox-gfm emmet-mode htmlize indium vlf django-mode pydoc realgud solarized-theme python-django php+-mode php-auto-yasnippets web-mode django-snippets python-docstring yasnippet-snippets emms material-theme pydoc-info python-mode elpy ein anaconda-mode auto-complete)))
 '(shell-mode-hook nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#263238" :foreground "#ffffff" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "outline" :family "Hack")))))

;; MELPA  needed?

 (require 'package) ;; You might already have this line
 (let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                     (not (gnutls-available-p))))
        (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
   (add-to-list 'package-archives (cons "melpa" url) t))
 (when (< emacs-major-version 24)
   ;; For important compatibility libraries like cl-lib
   (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
 (package-initialize) ;; You might already have this line

;; INSTALL PACKAGES
;; --------------------------------------

(require 'package)

(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(;; free space
    ein    
    elpy
    emmet-mode
    flycheck
    indium
    material-theme
    py-autopep8
    racket-mode
    ;; tern
    web-mode
    yasnippet
    yasnippet-snippets
    zenburn-theme
    ;; javascript
    js2-mode
    company-tern))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)


;; BASIC CUSTOMIZATION
;; --------------------------------------

(load-theme
 'material ;; load material theme
 ;; 'zenburn
 t)

;; tern-mode
(add-to-list 'load-path "e:/paul/4d8c8994-70e4-4174-88e2-7bf59019245b/home/github/tern/emacs/")
(autoload 'tern-mode "tern.el" nil t)

;; (global-linum-mode t) ;; enable line numbers globally

;; ELPY config

(package-initialize)
(elpy-enable)

;; Flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; Autopep8
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; Racket
(require 'racket-mode)
(setq racket-racket-program "C:/Program Files/Racket/racket.exe")
(setq racket-raco-program "C:/Program Files/Racket/raco.exe")

;; EIN (Emacs IPython Notebooks) setup

;; (require 'ein)
;; (require 'ein-loaddefs)
;; (require 'ein-notebook)
;; (require 'ein-subpackages)


;; IPython integration

;; (elpy-use-ipython)
;; error: elpy-use-ipython is deprecated; see https://elpy.readthedocs.io/en/latest/ide.html#interpreter-setup
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")

;; Yasnippet

(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

;; EMMS !!!
;; (require 'emms-setup)
;; (emms-all)
;; (emms-default-players)
;; (add-to-list 'load-path "~/elisp/emms/lisp/")

;; (add-to-list 'load-path "~/elisp/emms/")
;; (require 'emms-setup)
;; (emms-standard)
;; (emms-default-players)

;; I need Python to use utf-8 so I do

;; (add-hook 'python-mode-hook
;; 	  (lambda ()
;; 	    (setenv "LANG" "en_US.UTF-8")))

;; But it doesn't help

;; Trying to set up proper coding system
; (setq default-buffer-file-coding-system 'utf-8)
; (setq-default coding-system-for-read    'utf-8)
; (setq file-name-coding-system           'utf-8)
; (set-selection-coding-system            'utf-8)
; (set-keyboard-coding-system        'utf-8-unix)
; (set-terminal-coding-system             'utf-8)
; (prefer-coding-system                   'utf-8)
;; haven't worked


;; SOME CUSTOM .EL FILES
;; --------------------------------------

;; Provides a custom command "diceware-get-word"
;; (load-file "e:/paul/4d8c8994-70e4-4174-88e2-7bf59019245b/Documents/.emacs.d/diceware.el")
;; Works fine
;; (add-to-list 'load-path "e:/paul/4d8c8994-70e4-4174-88e2-7bf59019245b/Documents/.emacs.d/diceware.el")
;; Didn't work somehow. Should find out why later.

;; Org customization
(setq org-link-abbrev-alist
      '(("library" . "e:/paul/4d8c8994-70e4-4174-88e2-7bf59019245b/library/")
	("home" . "e:/paul/4d8c8994-70e4-4174-88e2-7bf59019245b/home/")))

;; hunspell
(add-to-list 'exec-path  "c:/Program Files/hunspell-1.3.2-3-w32-bin/bin/")

(setq ispell-program-name (locate-file "hunspell"
				       exec-path exec-suffixes
				       'file-executable-p))
 (setq ispell-local-dictionary-alist '(

       (nil
           "[[:alpha:]]"
           "[^[:alpha:]]"
           "[']"
           t
           ("-d" "en_GB" "-p" "D:\\hunspell\\share\\hunspell")
           nil
           utf-8)

       ("american"
           "[[:alpha:]]"
           "[^[:alpha:]]"
           "[']"
           t
           ("-d" "en_US" "-p" "D:\\hunspell\\share\\hunspell")
           nil
           utf-8)
       ("british"
           "[[:alpha:]]"
           "[^[:alpha:]]"
           "[']"
           t
           ("-d" "en_GB" "-p" "D:\\hunspell\\share\\hunspell")
           nil
           utf-8)
       ("russian"
           "[АБВГДЕЁЖЗИЙКЛМHОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя]"
           "[^АБВГДЕЁЖЗИЙКЛМHОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя]"
           "[']"
           t
           ("-d" "ru_RU" "-p" "D:\\hunspell\\share\\hunspell")
           nil
           utf-8)
;;        ("francais"
;;            "[[:alpha:]ÀÂÇÈÉÊËÎÏÔÙÛÜàâçèéêëîïôùûü]"
;;            "[^[:alpha:]ÀÂÇÈÉÊËÎÏÔÙÛÜàâçèéêëîïôùûü]"
;;            "[-']"
;;            t
;;            ("-d" "fr-classique" "-p" 
;; "D:\\hunspell\\share\\hunspell\\personal.fr")
;;            nil
;;            utf-8)
       ;;         )
       ))

(require 'ispell)


