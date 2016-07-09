(el-get-bundle! typescript-mode in ananthakumaran/typescript.el)

(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))

(el-get-bundle! tide)
(add-hook 'typescript-mode-hook
          (lambda ()
            (tide-setup)
            (flycheck-mode t)
            (setq flycheck-check-syntax-automatically '(save mode-enabled))
            (eldoc-mode t)
            (company-mode-on)))


