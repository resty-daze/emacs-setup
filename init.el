(defun require-with-directory (directory sub-directory lib)
  (let ((old-load-path load-path))
    (add-to-list 'load-path (concat directory sub-directory))
    (require lib)
    (setq load-path old-load-path)))

(let ((plugin-dir (concat emacs-setup-path "/plugin/")))
  ;; color-theme
  (require-with-directory plugin-dir "color-theme" 'color-theme)
  ;; color-theme-twilight
  (require-with-directory plugin-dir "color-theme-twilight" 'color-theme-twilight)
  (color-theme-twilight)
  ;; auto-complete
  (require-with-directory plugin-dir "auto-complete" 'auto-complete-config)
  (add-to-list 'ac-dictionary-directories 
               (concat plugin-dir "auto-complete/ac-dict"))
  (ac-config-default))

(mapcar 'load-file (directory-files "personal" 't "^[^#].*el$"))



