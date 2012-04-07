(setq work-dir (file-name-directory load-file-name))

;; compile color-theme and color-theme-twilight
(let ((color-theme-dir (concat work-dir "src/color-theme-6.6.0"))
      (old-load-path 'load-path))
  (add-to-list 'load-path color-theme-dir)
  (byte-recompile-directory color-theme-dir 0)
  ;(byte-recompile-directory (concat color-theme-dir "themes") 0)
  (make-directory (concat work-dir "plugin/color-theme/themes") 't)
  (mapcar (lambda (f) (copy-file f (concat work-dir "plugin/color-theme/") 't))
	  (directory-files color-theme-dir 't "^[^#].*elc?$"))
  (mapcar (lambda (f) (copy-file f (concat work-dir "plugin/color-theme/themes/") 't))
	  (directory-files (concat color-theme-dir "/themes/") 't "^[^#].*elc?$"))
  (byte-compile-file (concat work-dir 
                             "plugin/color-theme-twilight/color-theme-twilight.el"))
  (setq load-path old-load-path))

;; compile auto-complete
(make-directory (concat work-dir "plugin/auto-complete"))
(shell-command (concat "emacs -batch -l " 
		       work-dir "src/auto-complete-1.3.1/etc/install.el "
		       work-dir "plugin/auto-complete"))


