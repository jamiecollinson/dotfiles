(deftheme panda
  "Created 2018-01-11.")

(let ((bg "#2e2e2e")
      (bg+1 "#383838")
      (bg+2 "#424242")
      (bg+3 "#474747")
      (fg "#b6b6b6")
      (fg+1 "#e6e6e6")

      (cyan "#35ffdc")
      (pink "#ff90d0")
      (red "#ec2864")
      (orange "#ffb86c")
      (blue "#7dc1ff")
      (purple "#b084eb"))

  (custom-theme-set-faces
   'panda
   `(default ((t (:background ,bg :foreground ,fg))))
   `(cursor ((t (:background ,bg+3))))
   `(hl-line ((t (:background ,bg+3))))
   `(font-lock-keyword-face ((t (:foreground ,pink))))
   `(font-lock-doc-face ((t (:foreground ,orange))))
   `(font-lock-string-face ((t (:foreground ,orange))))
   `(font-lock-builtin-face ((t (:foreground ,blue))))
   `(font-lock-type-face ((t (:foreground ,cyan)))))

  (custom-theme-set-variables
   'panda
   `(ansi-color-names-vector
     [,bg ,red ,purple ,orange ,blue ,pink ,cyan ,fg]))
  )

(provide-theme 'panda)
