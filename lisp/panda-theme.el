(deftheme panda
  "Created 2018-01-11.")

(let ((bg "#292A2B")

      (fg "#E6E6E6")

      (caret "#F8F8F0")
      (comment "#676B79")
      (hl "#404954")

      (cyan "#35ffdc")
      (pink "#ff90d0")
      (red "#ec2864")
      (orange "#ffb86c")
      (blue "#7dc1ff")
      (purple "#b084eb"))

  (custom-theme-set-faces
   'panda

   ;; Default
   `(default ((t (:background ,bg :foreground ,fg))))
   `(italic ((t (:italic t :font "Operator Mono Italic 12"))))
   `(cursor ((t (:background ,caret))))
   `(ffap ((t :foreground ,caret)))
   `(fringe ((t (:background ,bg))))
   `(highlight ((t (:background ,hl))))
   `(region ((t :background ,hl)))
   `(linum ((t :foreground ,comment)))
   `(lazy-highlight ((t (:background ,orange))))
   `(link ((t (:foreground ,blue :underline t))))
   `(minibuffer-prompt ((t :foreground ,pink)))
   `(region ((t (:background ,orange :foreground ,bg))))
   `(show-paren-match-face ((t (:background ,red))))
   `(trailing-whitespace ((t :foreground nil :background ,red)))
   `(vertical-border ((t (:foreground ,comment))))
   `(warning ((t (:foreground ,red))))

   ;; Fontlock faces
   `(font-lock-builtin-face ((t (:foreground ,blue))))
   `(font-lock-comment-face ((t (:foreground ,comment :inherit italic))))
   `(font-lock-constant-face ((t (:foreground ,orange))))
   `(font-lock-doc-face ((t (:foreground ,comment :inherit italic))))
   `(font-lock-function-name-face ((t (:foreground ,orange))))
   `(font-lock-keyword-face ((t (:foreground ,pink))))
   `(font-lock-string-face ((t (:foreground ,cyan))))
   `(font-lock-type-face ((t (:foreground ,cyan))))
   `(font-lock-variable-name-face ((t (:foreground ,orange))))
   `(font-lock-warning-face ((t (:foreground ,red :background ,hl))))

   ;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((t :foreground ,caret)))
   `(rainbow-delimiters-depth-2-face ((t :foreground ,cyan)))
   `(rainbow-delimiters-depth-3-face ((t :foreground ,pink)))
   `(rainbow-delimiters-depth-4-face ((t :foreground ,blue)))
   `(rainbow-delimiters-depth-5-face ((t :foreground ,orange)))
   `(rainbow-delimiters-depth-6-face ((t :foreground ,purple)))
   `(rainbow-delimiters-depth-7-face ((t :foreground ,cyan)))
   `(rainbow-delimiters-depth-8-face ((t :foreground ,pink)))
   `(rainbow-delimiters-unmatched-face ((t :foreground ,red :underline ,red)))

   ;; git-gutter
   `(git-gutter:added ((t :foreground ,cyan)))
   `(git-gutter:changed ((t :foreground ,orange)))
   `(git-gutter:deleted ((t :foreground ,red)))

  ;; RJSX mode
   `(rjsx-attr ((t :foreground ,orange :inherit italic)))
   `(rjsx-tag ((t :foreground ,red)))
   )

  (custom-theme-set-variables
   'panda
   `(ansi-color-names-vector
     [,bg ,red ,purple ,orange ,blue ,pink ,cyan ,fg])))

(provide-theme 'panda)
