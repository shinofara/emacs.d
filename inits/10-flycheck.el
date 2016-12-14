(el-get-bundle! flycheck)
(add-hook 'after-init-hook 'global-flycheck-mode)

(defadvice flymake-post-syntax-check (before flymake-force-check-was-interrupted)
  (setq flymake-check-was-interrupted t))
(ad-activate 'flymake-post-syntax-check)
