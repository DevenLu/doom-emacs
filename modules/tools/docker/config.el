;;; tools/docker/config.el -*- lexical-binding: t; -*-

(after! docker
  (set-evil-initial-state!
    '(docker-container-mode
      docker-image-mode
      docker-network-mode
      docker-volume-mode
      docker-machine-mode)
    'emacs))
