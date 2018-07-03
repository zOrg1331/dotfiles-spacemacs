;;; funcs.el --- hex-decode Layer functions File for Spacemacs
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: Pavel Nakonechnyi <zorg1331@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; ASCII-HEX converion
(defun spacemacs/hex-decode-string (in-string)
  (let ((hex-string (replace-regexp-in-string "[ \r\n\t]" "" in-string)))
    (let ((res nil))
      (dotimes (i (/ (length hex-string) 2) (apply #'concat (reverse res)))
        (let ((hex-byte (substring hex-string (* 2 i) (* 2 (+ i 1)))))
          (push (format "%c" (string-to-number hex-byte 16)) res))))))

(defun spacemacs/hex-encode-string (ascii-string)
  (let ((res nil))
    (dotimes (i (length ascii-string) (apply #'concat (reverse res)))
      (let ((ascii-char (substring ascii-string i  (+ i 1))))
        (push (format "%x" (string-to-char ascii-char)) res)))))

(defun spacemacs/hex-decode-region (start end)
  "Decode a hex string in the selected region."
  (interactive "r")
  (save-excursion
    (let* ((decoded-text
            (spacemacs/hex-decode-string
             (buffer-substring start end))))
      (delete-region start end)
      (insert decoded-text))))

(defun spacemacs/hex-encode-region (start end)
  "Encode a hex string in the selected region."
  (interactive "r")
  (save-excursion
    (let* ((encoded-text
            (spacemacs/hex-encode-string
             (buffer-substring start end))))
      (delete-region start end)
      (insert encoded-text))))
