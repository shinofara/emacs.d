(el-get-bundle! 'exec-path-from-shell)

(let ((envs '("PATH" "GOPATH")))
  (exec-path-from-shell-copy-envs envs))

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; go-mode
;; In advance, install godef, gocode, and goimports in $GOPATH.
;;   go get code.google.com/p/rog-go/exp/cmd/godef
;;   go get -u github.com/nsf/gocode
;;   go get code.google.com/p/go.tools/cmd/goimports
;; exec-path should include a path to ~/go/bin.
;; So DO NOT launch an emacs from App icon, DO launch an emacs from terminal (shell).
;(el-get-bundle! 'go-mode)

;(add-hook 'before-save-hook 'gofmt-before-save)

;(el-get-bundle! 'go-autocomplete)

(add-to-list 'exec-path (expand-file-name "/usr/local/bin"))
(add-to-list 'exec-path (expand-file-name "~/go/bin"))

;; 必要なパッケージのロード
(el-get-bundle! 'go-mode)
(el-get-bundle! company in company-mode/company-mode)
(el-get-bundle! go-eldoc)

;;; company-go
(el-get-bundle! company-go :url "https://raw.githubusercontent.com/nsf/gocode/master/emacs-company/company-go.el")


;; 諸々の有効化、設定
(add-hook 'go-mode-hook 'company-mode)
(add-hook 'go-mode-hook 'flycheck-mode)

(add-hook 'go-mode-hook (lambda ()
                          ;;(setq gofmt-command "goimports")
                          (add-hook 'before-save-hook 'gofmt-before-save)
                          (set (make-local-variable 'compile-command)
                               "go build -v && go test -v && go vet")
                          (local-set-key (kbd "M-.") 'godef-jump))
                          ;;(set (make-local-variable 'company-backends) '(company-go))
                          (company-mode))

(custom-set-variables
 '(company-global-modes '(not eshell-mode)))


(el-get-bundle go-guru
  :type http
  :url "https://raw.githubusercontent.com/dominikh/go-mode.el/master/go-guru.el")
