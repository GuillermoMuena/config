;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

;; IVY
(ivy-mode 1)

;; Sacamos los archivos de backup que crea emacs y los guardamos
;; en una carpeta separada, en la carpeta de de emacs.d
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )

;; Vamos a poner los números de línea
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

;; Auto fill mode
(add-hook 'text-mode-hook
          (lambda ()
            (when (y-or-n-p "Auto Fill mode? ")
              (turn-on-auto-fill))))

;; Opciones de edición de Latex
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-save-query nil)
;(setq TeX-PDF-mode t)

;; Neotree, para navegar más fácilmente en los directtorios
(add-to-list 'load-path "~/.emacs.d/neotree/emacs-neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-smart-open t)

;; Eliminamos los whitespaces extra al guardar.
 (add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Si seleccionamos una región podemos directamente sobreescribirla
(delete-selection-mode t)


;; Cambiamos el tamaño predeterminado de fuente
(set-face-attribute 'default nil :height 90)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-doxygen-code-block ((t nil)))
 '(highlight-doxygen-comment ((t (:inherit font-lock-doc-face :slant italic)))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (melancholy)))
 '(custom-safe-themes
   (quote
    ("a8c2d5b1b4b46732d99052b715fe2638f233b775c1c78741f934c6c2ed575347" "f0e65181264e4f175c7a2e2254b8c81b6e4b67eadcb3359e29591df8bc54de35" default)))
 '(fci-rule-color "#000000")
 '(global-display-line-numbers-mode t)
 '(highlight-doxygen-global-mode t nil (highlight-doxygen))
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (ace-window rainbow-delimiters counsel slime swiper org ivy)))
 '(tool-bar-mode nil)
 '(tooltip-mode nil)
 '(vc-annotate-background "#2f2f2f")
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#D01A4E")
     (60 . "#cb4b16")
     (80 . "#b58900")
     (100 . "#b58900")
     (120 . "#b58900")
     (140 . "#5f127b")
     (160 . "#5f127b")
     (180 . "#859900")
     (200 . "#859900")
     (220 . "#859900")
     (240 . "#859900")
     (260 . "#2aa198")
     (280 . "#268bd2")
     (300 . "#268bd2")
     (320 . "#268bd2")
     (340 . "#94BFF3")
     (360 . "#d33682"))))
 '(vc-annotate-very-old-color "#d33682"))

;;; C-h => delete-backward-char

;;; C-h para delete-backward-char (como en las terminales). También aprovecho
;;; para reasignar el "C-h" bajo paredit.
;; (global-set-key (kbd "C-h") 'backward-delete-char)
(define-key key-translation-map (kbd "C-h") [?\C-?])
(global-set-key (kbd "C-S-h") help-map)
(add-hook
 'paredit-mode-hook
 (lambda () (define-key paredit-mode-map (kbd "C-h")
              'paredit-backward-delete)))
