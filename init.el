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
    emmet-mode
    flycheck
    web-mode
    ;; themes
    habamax-theme
    ;; Markdown
    flymd
    markdown-preview-eww
    markdown-preview-mode
    writeroom-mode
    ;; org backends
    ox-epub ox-gfm ox-hugo
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

;; Org auto export hook
(defun org-export-to-latex-hook()
  "Auto export latex"
  (when (eq major-mode 'org-mode)
    (org-latex-export-to-latex)))

(defun org-export-to-pdf-hook1()
  "Auto export latex"
  (when (eq major-mode 'org-mode)
    (org-latex-export-to-pdf)))

(defun org-export-to-pdf-hook()
  "Auto export latex"
  (when (eq major-mode 'org-mode)
    (org-latex-export-to-latex)
    (shell-command "xelatex *.tex &")))


(setq holiday-local-holidays '((holiday-fixed 1 7 "Рождество Христово")
			       (holiday-fixed 2 23 "День защитника Отечества")
			       (holiday-fixed 3 8 "Международный женский день")
			       (holiday-fixed 5 1 "Праздник Весны и Труда")
			       (holiday-fixed 5 9 "День Победы")
			       (holiday-fixed 6 12 "День России")
			       (holiday-fixed 11 4 "День народного единства")))

(setq org-entities-user '("yat" "" "" "" "" "ѣ"))

;;;;;; My custom
;; key for odroid terminal emacs
(global-set-key (kbd "<f9>") 'comment-line )

(fset 'quo
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("\\bdquo{}  \\rdquo " 0 "%d")) arg)))

;; (global-set-key (kbd "C-x C-k b q") 'quo )
(global-set-key (kbd "<f8>") 'quo )

(fset 'org-put-source
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("#+BEGIN_SRC#+END_XRCSRC" 0 "%d")) arg)))

(global-set-key (kbd "<f7>") 'org-put-source )


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
    ("~/4d8c8994-70e4-4174-88e2-7bf59019245b/home/notebook.org" "/media/odroid/24D9880F12A4A119/paul/4d8c8994-70e4-4174-88e2-7bf59019245b/home/diary.org")))
 '(org-agenda-todo-list-sublevels nil)
 '(org-latex-classes
   (quote
    (("coursework" "\\documentclass{coursework}"
      ("" . ""))
     ("custom" "\\documentclass[14pt]{custom}"
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
      ("\\paragraph{%s}" . "\\paragraph*{%s}")
      ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
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
    (markdown-preview-eww markdown-preview-mode org writeroom-mode web-mode use-package toc-org py-autopep8 ox-hugo ox-gfm org-ref lorem-ipsum habamax-theme flymd flycheck emmet-mode elpy)))
 '(safe-local-variable-values
   (quote
    ((eval add-hook
	   (quote after-save-hook)
	   (quote org-export-to-latex-hook)))))
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
 '(default ((t (:inherit nil :stipple nil :background "#ffffff" :foreground "#000000" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 128 :width normal :foundry "SRC" :family "Source Serif Pro"))))
 '(org-default ((t (:family "Source Serif Pro")))))
