;;; funcs.el --- pygments Layer functions File for Spacemacs
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: Pavel Nakonechnyi <zorg1331@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defun spacemacs/pygments-html-cmd (beginning-line-number)
  (let ((lexer (gethash major-mode spacemacs/pygments-lexers))
        (linenostart (number-to-string beginning-line-number)))
    (if (not lexer) (error (concat "error: no lexer for " (symbol-name major-mode))))
    (concat "pygmentize3 -f html"
            " -l " lexer
            " -O style=autumn,linenos=inline,noclasses=true,linenostart=" linenostart)))

(defun spacemacs/pygments-html (&optional output-buffer-name)
  (interactive)
  (save-window-excursion
    (unless output-buffer-name
      (setq output-buffer-name spacemacs/pygments-html-output-buffer-name))
    (let* ((beginning-line-number (line-number-at-pos (region-beginning)))
           (shell-command (spacemacs/pygments-html-cmd beginning-line-number)))
      (shell-command-on-region (region-beginning)
                               (region-end)
                               shell-command
                               output-buffer-name))
    (switch-to-buffer output-buffer-name)
    (clipboard-kill-ring-save (point-min) (point-max))
    output-buffer-name))

(defun spacemacs/pygments-html-preview (&optional output-buffer-name)
  (interactive)
  (unless output-buffer-name
    (setq output-buffer-name spacemacs/pygments-html-output-buffer-name))
  (browse-url-of-buffer (spacemacs/pygments-html output-buffer-name)))
