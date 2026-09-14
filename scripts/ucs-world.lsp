;; ucs-world.lsp - Reset the UCS to world and restore plan view
;; Command: UCSW
(defun c:UCSW ( )
  (command "_.UCS" "_W")
  (command "_.PLAN" "_C")
  (princ "\nUCS reset to world.")
  (princ)
)
