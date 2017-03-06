(add-hook 'before-save-hook 'delete-trailing-whitespace) ;; 行末の空白を削除
(setq-default show-trailing-whitespace t) ;; 行末の空白をハイライト
