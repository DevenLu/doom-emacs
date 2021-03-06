;;; app/write/autoload.el -*- lexical-binding: t; -*-

;;;###autoload
(defvar +write-mode-map (make-sparse-keymap)
  "TODO")

;;;###autoload
(define-minor-mode +write-mode
  "Turns Emacs into a more comfortable writing environment and word processor."
  :init-value nil
  :keymap +write-mode-map
  (setq-local visual-fill-column-center-text t)
  (when +write-text-scale
    (text-scale-set (if +write-mode 2 0)))
  (when +write-line-spacing
    (setq-local line-spacing +write-line-spacing)))

;;;###autoload
(defun +write-init-org-mode-h ()
  "Initializes `org-mode' specific settings for `+write-mode'."
  (when (eq major-mode 'org-mode)
    (+org-pretty-mode (if +write-mode +1 -1))))

;;;###autoload
(defun +write-init-line-numbers-h ()
  (display-line-numbers-mode (if +write-mode +1 -1)))

;;;###autoload
(defun +write-init-mixed-pitch-h ()
  (mixed-pitch-mode (if +write-mode +1 -1)))

;;;###autoload
(defun +write-init-visual-fill-column-h ()
  (visual-fill-column-mode (if +write-mode +1 -1)))

;;;###autoload
(add-hook! '+write-mode-hook
  #'(flyspell-mode
     visual-line-mode
     +write-init-mixed-pitch-h
     +write-init-visual-fill-column-h
     +write-init-line-numbers-h
     +write-init-org-mode-h))
