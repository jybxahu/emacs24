(add-hook 'sql-mode-hook 'sql-highlight-mysql-keywords)
(add-hook 'sql-mode-hook 'sql-highlight-postgres-keywords)


(setq sql-connection-alist
      '((ec2-forecasting
         (sql-product 'mysql)
         (sql-server "ec2-landfill-forecasting-rds.db.amazon.com")
         (sql-user "ec2cp")
         (sql-password "ec2cp")
         (sql-database "capacity_forecasting")
         (sql-port 8192))
        (ec2-forecasting-test
         (sql-product 'mysql)
         (sql-server "ec2-forecast-yiboj.ckjvo9k4cyei.us-east-1.rds.amazonaws.com")
         (sql-user "ec2cp")
         (sql-password "ec2cp")
         (sql-database "capacity_forecasting")
         (sql-port 8192))
	(generic-forecasting
         (sql-product 'mysql)
         (sql-server "aws-forecasting.db.amazon.com")
         (sql-user "ec2cp")
         (sql-password "ec2cp")
         (sql-database "aws_forecasting")
         (sql-port 8192))
	(aws-datawarehouse
         (sql-product 'postgres)
         (sql-server "awsdw-rs-sandbox1.db.amazon.com")
;;;         (sql-server "awsdw-rs-adhoc1.db.amazon.com")
         (sql-user "yiboj")
         (sql-password "jyb924XAHU")
         (sql-database "awsdw")
         (sql-port 8192)))
)

(defun sql-connect-preset (name)
  "Connect to a predefined SQL connection listed in `sql-connection-alist'"
  (eval `(let ,(cdr (assoc name sql-connection-alist))
    (flet ((sql-get-login (&rest what)))
      (sql-product-interactive sql-product)))))

(defun mysql-ec2-prod ()
  (interactive)
  (sql-connect-preset 'ec2-forecasting))

(defun mysql-ec2-test ()
  (interactive)
  (sql-connect-preset 'ec2-forecasting-test))

(defun mysql-generic ()
  (interactive)
  (sql-connect-preset 'generic-forecasting))

(defun postgres-awsdw ()
  (interactive)
  (sql-connect-preset 'aws-datawarehouse))
