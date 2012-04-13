; c-mode
(setq c-basic-offset 4)
(setq-default indent-tabs-mode nil)
(add-hook 'c-mode-common-hook
	  (lambda ()
	    (linum-mode)
	    (local-set-key "\r" 'newline-and-indent)
            (c-set-style "k&r")))
