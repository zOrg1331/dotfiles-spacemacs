;;; config.el --- pygments Layer configuration File for Spacemacs
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: Pavel Nakonechnyi <zorg1331@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; Variables

(setq spacemacs/pygments-lexers (make-hash-table))

(puthash 'emacs-lisp-mode "common-lisp" spacemacs/pygments-lexers)
(puthash 'scala-mode "scala" spacemacs/pygments-lexers)
(puthash 'java-mode "java" spacemacs/pygments-lexers)
(puthash 'ruby-mode "rb" spacemacs/pygments-lexers)
(puthash 'python-mode "py" spacemacs/pygments-lexers)
(puthash 'sh-mode "sh" spacemacs/pygments-lexers)
(puthash 'diff-mode "diff" spacemacs/pygments-lexers)
(puthash 'nxml-mode "xml" spacemacs/pygments-lexers)
(puthash 'js-mode "js" spacemacs/pygments-lexers)
(puthash 'tcl-mode "tcl" spacemacs/pygments-lexers)

(defconst spacemacs/pygments-html-output-buffer-name
  "*pygments-html-output*" "temporary buffer for pygments-html output")
