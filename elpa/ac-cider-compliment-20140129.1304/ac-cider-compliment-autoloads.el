;;; ac-cider-compliment-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (ac-cider-compliment-popup-doc ac-cider-compliment-repl-setup
;;;;;;  ac-cider-compliment-setup) "ac-cider-compliment" "ac-cider-compliment.el"
;;;;;;  (21289 54968 441658 286000))
;;; Generated autoloads from ac-cider-compliment.el

(defface ac-cider-compliment-candidate-face '((t (:inherit ac-candidate-face))) "\
Face for nrepl candidates." :group (quote auto-complete))

(defface ac-cider-compliment-selection-face '((t (:inherit ac-selection-face))) "\
Face for the nrepl selected candidate." :group (quote auto-complete))

(defconst ac-cider-compliment-source-defaults '((available . ac-cider-compliment-available-p) (candidate-face . ac-cider-compliment-candidate-face) (selection-face . ac-cider-compliment-selection-face) (prefix . ac-cider-compliment-symbol-start-pos) (match . ac-cider-compliment-match-everything) (document . ac-cider-compliment-documentation) (cache)) "\
Defaults common to the various completion sources.")

(defvar ac-source-compliment-everything (append '((candidates . ac-cider-compliment-candidates-everything) (symbol . "v")) ac-cider-compliment-source-defaults) "\
Auto-complete source for CIDER buffers.")

(defvar ac-source-compliment-everything-without-context (append '((candidates . ac-cider-compliment-candidates-everything-without-context) (symbol . "v")) ac-cider-compliment-source-defaults) "\
Auto-complete source for CIDER REPL buffer.")

(autoload 'ac-cider-compliment-setup "ac-cider-compliment" "\
Add the Compliment completion source to the front of `ac-sources'.
This affects only the current buffer.

\(fn)" t nil)

(autoload 'ac-cider-compliment-repl-setup "ac-cider-compliment" "\
Add the Compliment completion source to the front of `ac-sources'.
This affects only the current buffer. This should be used in
CIDER REPL buffer.

\(fn)" t nil)

(autoload 'ac-cider-compliment-popup-doc "ac-cider-compliment" "\
A popup alternative to `nrepl-doc'.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("ac-cider-compliment-pkg.el") (21289 54968
;;;;;;  584348 278000))

;;;***

(provide 'ac-cider-compliment-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; ac-cider-compliment-autoloads.el ends here
