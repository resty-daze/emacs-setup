; c-mode
(setq-default indent-tabs-mode nil)
(add-hook 'c-mode-common-hook
	  (lambda ()
	    (linum-mode)
	    (local-set-key "\r" 'newline-and-indent)
            (c-set-style "k&r")
            (setq c-basic-offset 4)))

; use c++-mode for .h
(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))

