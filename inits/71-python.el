(el-get-bundle! python-mode)
(el-get-bundle! ac-python)
(el-get-bundle! jinja2-mode)
;;(el-get-bundle! company-jedi in tkf/emacs-jedi)
(el-get-bundle syohex/emacs-company-jedi
  :name company-jedi
  :depends-on (jedi-core company-mode))

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
