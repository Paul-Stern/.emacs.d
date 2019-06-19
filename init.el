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

;; habamax-theme
;; Using use-package
(use-package habamax-theme
  :config
  (setq habamax-theme-variable-heading-heights t)
  (load-theme 'habamax t))


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
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#212121" "#B71C1C" "#558b2f" "#FFA000" "#2196f3" "#4527A0" "#00796b" "#FAFAFA"))
 '(custom-safe-themes
   (quote
    ("732b807b0543855541743429c9979ebfb363e27ec91e82f463c91e68c772f6e3" "efbe8f0a87281bcfa5e560d5ca10268c735de3a3bb160b54c520d02609aed9d8" default)))
 '(fci-rule-color "#ECEFF1")
 '(hl-sexp-background-color "#efebe9")
 '(org-agenda-files
   (quote
    ("e:/paul/4d8c8994-70e4-4174-88e2-7bf59019245b/home/work/teaching/english/eng.org" "e:/paul/4d8c8994-70e4-4174-88e2-7bf59019245b/home/studying/6-й семестр/yspu.org" "e:/paul/4d8c8994-70e4-4174-88e2-7bf59019245b/home/notebook.org" "e:/paul/4d8c8994-70e4-4174-88e2-7bf59019245b/home/diary.org")))
 '(org-latex-classes
   (quote
    (("custom" "\\documentclass[14pt]{custom}"
      ("" . ""))
     ("article" "\\documentclass[11pt]{article}"
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
      ("\\paragraph{%s}" . "\\paragraph*{%s}")
      ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
     ("report" "\\documentclass[11pt]{report}"
      ("\\part{%s}" . "\\part*{%s}")
      ("\\chapter{%s}" . "\\chapter*{%s}")
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
     ("book" "\\documentclass[11pt]{book}"
      ("\\part{%s}" . "\\part*{%s}")
      ("\\chapter{%s}" . "\\chapter*{%s}")
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))))
 '(org-latex-default-class "article")
 '(package-selected-packages
   (quote
    (org zenburn-theme yasnippet-snippets writeroom-mode web-mode vlf use-package toc-org spacemacs-theme racket-mode py-autopep8 ox-hugo ox-gfm org-ref material-theme lorem-ipsum indium habamax-theme flymd flycheck emmet-mode elpy ein company-tern)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#B71C1C")
     (40 . "#FF5722")
     (60 . "#FFA000")
     (80 . "#558b2f")
     (100 . "#00796b")
     (120 . "#2196f3")
     (140 . "#4527A0")
     (160 . "#B71C1C")
     (180 . "#FF5722")
     (200 . "#FFA000")
     (220 . "#558b2f")
     (240 . "#00796b")
     (260 . "#2196f3")
     (280 . "#4527A0")
     (300 . "#B71C1C")
     (320 . "#FF5722")
     (340 . "#FFA000")
     (360 . "#558b2f"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "SystemWindow" :foreground "SystemWindowText" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "outline" :family "Hack")))))
