;; ucs-object.lsp - Align the UCS to a picked object
;; Command: UCSOBJ
;; Usage: pick a face or object that should define the working plane
(defun c:UCSOBJ ( / en )
  (setq en (car (entsel "\nPick an object to align the UCS to: ")))
  (if en
    (progn
      (command "_.UCS" "_OB" en)
      (princ "\nUCS aligned to object.")
    )
  )
  (princ)
)
