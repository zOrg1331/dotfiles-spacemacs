;;; funcs.el --- linux-kernel-style Layer functions File for Spacemacs
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: Pavel Nakonechnyi <zorg1331@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; see Documentation/process/codyng-style.rst
(defun spacemacs/c-lineup-arglist-tabs-only (ignored)
  "Line up argument lists by tabs, not spaces"
  (let* ((anchor (c-langelem-pos c-syntactic-element))
         (column (c-langelem-2nd-pos c-syntactic-element))
         (offset (- (1+ column) anchor))
         (steps (floor offset c-basic-offset)))
    (* (max steps 1)
       c-basic-offset)))

(add-hook 'c-mode-common-hook
          (lambda ()
            ;; Add kernel style
            (c-add-style
             "linux-tabs-only"
             '("linux" (c-offsets-alist
                        (arglist-cont-nonempty
                         c-lineup-gcc-asm-reg
                         spacemacs/c-lineup-arglist-tabs-only))))))

;; stolen from https://github.com/coldnew/coldnew-spacemacs
(defun spacemacs/linux-kernel-style ()
  (let ((filename (buffer-file-name)))
    ;; Enable kernel mode for the appropriate files
    (when (and filename
               (or (locate-dominating-file filename "Kbuild")
                   (locate-dominating-file filename "Kconfig")
                   (save-excursion (goto-char 0)
                                   (search-forward-regexp "^#include <linux/\\(module\\|kernel\\)\\.h>$" nil t))))
      (setq indent-tabs-mode t)
      (setq show-trailing-whitespace t)
      (setq tab-width 8)
      (setq c-basic-offset 8)
      (c-set-style "linux-tabs-only"))))

(add-hook 'c-mode-hook 'spacemacs/linux-kernel-style)
