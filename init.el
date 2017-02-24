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
  
  ;; psvn
  (require-with-directory plugin-dir "psvn" 'psvn)

  ;; xcscope
  (require-with-directory plugin-dir "xcscope" 'xcscope)
  )


(add-to-list 'load-path (concat emacs-setup-path "/language-mode"))
;; Markdown-Mode
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist (cons "\\.md" 'markdown-mode))

;; Yaml-Mode
(autoload 'yaml-mode "yaml-mode.el"
  "Major mode for editing Yaml files" t)
(add-to-list 'auto-mode-alist (cons "\\.yml" 'yaml-mode))

;; Lua-Mode
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

;; Javascript
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; CMake
(autoload 'cmake-mode "cmake-mode" "Major mode for editing CMake files" t)
(add-to-list 'auto-mode-alist (cons "CMakeLists.txt" 'cmake-mode))
(autoload 'cmake-font-lock-activate "cmake-font-lock" nil t)
(add-hook 'cmake-mode-hook 'cmake-font-lock-activate)

;; Modern C++ highlights
(require 'modern-cpp-font-lock)
(modern-c++-font-lock-global-mode t)

;; Load personal files
(mapcar 'load-file (directory-files (concat emacs-setup-path "/personal") 't "^[^#].*el$"))

