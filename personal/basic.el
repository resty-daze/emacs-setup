(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq make-backup-files nil)

; key binds
(global-set-key "\C-x\C-b" 'ibuffer)
(global-set-key "\C-c\c" 'compile)

;; gdb configure
(setq gdb-non-stop-setting nil)
; dired
(add-hook 'dired-load-hook 
          (lambda () 
            (load "dired-x")
            (add-hook 'dired-mode-hook 
                      (lambda ()
                        (dired-omit-mode 1)))))

