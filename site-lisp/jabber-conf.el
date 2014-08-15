;;;jabberconf.el for my jabber account
;;;initialize my google talk account
(setq tls-program '("openssl s_client -connect %h:%p -no_ssl2 -no_ticket"))
(setq jabber-account-list
        `(("jybxahu@gmail.com"
           (:network-server . "talk.google.com")
           (:port . 443)
           (:password . "dxmgyfnlsqzqiice")
           (:connection-type . ssl))))

;;Don't disturb me if someone chage presence status (usually remote clients make this automatically):
(set 'jabber-alert-presence-message-function (lambda (who oldstatus newstatus statustext) nil))

;;Control message history (which stored in ~/.emacs-jabber dir):
(setq
  jabber-history-enabled t
  jabber-use-global-history nil
  jabber-backlog-number 40
  jabber-backlog-days 30
  jabber-chat-header-line-format
  )

(defun my-jabber-chat-delete-or-bury ()
  (interactive)
  (if (eq 'jabber-chat-mode major-mode)
      (condition-case e
          (delete-frame)
        (error
         (if (string= "Attempt to delete the sole visible or iconified frame"
                      (cadr e))
            (bury-buffer))))))
