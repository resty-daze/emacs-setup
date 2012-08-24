(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq make-backup-files nil)

(when (equal window-system 'w32)
  (set-frame-font "Consolas-11")
  (set-fontset-font "fontset-default" 'han '("Microsoft YaHei" . "unicode-bmp")))
; key binds
(global-set-key "\C-x\C-b" 'ibuffer)
(global-set-key "\C-c\c" 'compile)

;; enable visual feed back on selections
(setq transient-mark-mode t)

;; gdb configure
(setq gdb-non-stop-setting nil)

; linum-mode
(global-linum-mode)
(setq linum-format "%d ")
(column-number-mode)

; ido-mode
(ido-mode)

; projectile
(projectile-global-mode)

; dired
(add-hook 'dired-load-hook 
          (lambda () 
            (load "dired-x")
            (add-hook 'dired-mode-hook 
                      (lambda ()
                        (dired-omit-mode 1)))))

