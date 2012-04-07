# Emacs-Setup

This is my emacs configure project.

Now it is under construction

## Usage

clone it to a place, then compile 

```
emacs -batch -l compile.el
```

add following line into you `.emacs` file:

```
(setq emacs-setup-path "~/emacs-setup-path")  ; The path where you clone the project
(load-file "~/emacs-setup-path/init.el")
```
