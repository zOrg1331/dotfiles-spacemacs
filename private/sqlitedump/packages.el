(defconst sqlitedump-packages
  '(
   (sqlite-dump :location local)
   ))

(defun sqlitedump/init-sqlite-dump ()
  (use-package sqlite-dump)
  (modify-coding-system-alist 'file "\\.db\\'" 'raw-text-unix)
  (add-to-list 'auto-mode-alist '("\\.db\\'" . sqlite-dump))
  )
