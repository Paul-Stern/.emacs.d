;; INSTALL PACKAGES
;; --------------------------------------

(require 'package)

(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))


(defvar myPackages
  '(;;
    use-package
    ;; free space
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
    ;; themes
    habamax-theme
    zenburn-theme
    ;; javascript
    js2-mode
    company-tern
    ;; writing
    flymd
    writeroom-mode
    ;; org backends
    ox-hugo
    ))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

;; Using use-package
;; (use-package habamax-theme
;;   :config
;;   (setq habamax-theme-variable-heading-heights t)
;;   (load-theme 'habamax t))


;; BASIC CUSTOMIZATION
;; --------------------------------------

;; (load-theme
;;  'material ;; load material theme
;;  ;; 'zenburn
;;  t)

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


(setq holiday-local-holidays '((holiday-fixed 1 7 "Рождество Христово")
			       (holiday-fixed 2 23 "День защитника Отечества")
			       (holiday-fixed 3 8 "Международный женский день")
			       (holiday-fixed 5 1 "Праздник Весны и Труда")
			       (holiday-fixed 5 9 "День Победы")
			       (holiday-fixed 6 12 "День России")
			       (holiday-fixed 11 4 "День народного единства")))
(setq org-entities-user '("yat" "" "" "" "" "ѣ"))
(require 'org-ref)

;; toc-org
(if (require 'toc-org nil t)
    (add-hook 'org-mode-hook 'toc-org-mode)
  (warn "toc-org not found"))

;; lilypond-mode
;; from lilypond-init.el

;; start lilypond-init.el 
(setq load-path (append (list (expand-file-name "~/.emacs.d/site-lisp")) load-path))

(autoload 'LilyPond-mode "lilypond-mode" "LilyPond Editing Mode" t)
(add-to-list 'auto-mode-alist '("\\.ly$" . LilyPond-mode))
(add-to-list 'auto-mode-alist '("\\.ily$" . LilyPond-mode))
(add-hook 'LilyPond-mode-hook (lambda () (turn-on-font-lock)))
;; end lilypond-init.el


; (autoload 'LilyPond-mode "lilypond-mode")
; (setq auto-mode-alist
;       (cons '("\\.ly$" . LilyPond-mode) auto-mode-alist))
; 
; (add-hook 'LilyPond-mode-hook (lambda () (turn-on-font-lock)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("efbe8f0a87281bcfa5e560d5ca10268c735de3a3bb160b54c520d02609aed9d8" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "SystemWindow" :foreground "SystemWindowText" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "outline" :family "Hack")))))
