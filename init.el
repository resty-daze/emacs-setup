(defun require-with-directory (directory sub-directory lib)
  (let ((old-load-path load-path))
    (add-to-list 'load-path (concat directory sub-directory))
    (require lib)
    (setq load-path old-load-path)))

(let ((plugin-dir (concat emacs-setup-path "/plugin/")))
  (when window-system
    ;; color-theme
    (require-with-directory plugin-dir "color-theme" 'color-theme)
    ;; color-theme-twilight
    (require-with-directory plugin-dir "color-theme-twilight" 'color-theme-twilight)
    (color-theme-twilight))

  ;; auto-complete
  (require-with-directory plugin-dir "auto-complete" 'auto-complete-config)
  (add-to-list 'ac-dictionary-directories 
               (concat plugin-dir "auto-complete/ac-dict"))
  (ac-config-default)

  ;; yasnippet
  (require-with-directory plugin-dir "yasnippet" 'yasnippet)
  ; uncomment following line to make yasnippet global
  ;(yas/global-mode 1)

  ;; projectile
  (require-with-directory plugin-dir "projectile" 'projectile)
  
  )


(autoload 'markdown-mode (concat emacs-setup-path "/language-mode/markdown-mode.el")
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist (cons "\\.md" 'markdown-mode))

(mapcar 'load-file (directory-files (concat emacs-setup-path "/personal") 't "^[^#].*el$"))




