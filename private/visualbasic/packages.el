(defconst visualbasic-packages
  '(
   (visual-basic-mode :location local)
   ))

(defun visualbasic/init-visual-basic-mode ()
  (use-package visual-basic-mode)
  (push '("\\.\\(?:frm\\|\\(?:ba\\|cl\\|vb\\)s\\)\\'" . visual-basic-mode) auto-mode-alist)
  )
