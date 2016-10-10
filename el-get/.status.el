((ac-python status "installed" recipe
            (:name ac-python :features
                   (ac-python)
                   :after nil :description "Simple Python Completion Source for Auto-Complete" :depends auto-complete :type http :url "http://chrispoole.com/downloads/ac-python.el"))
 (auto-complete status "installed" recipe
                (:name auto-complete :type github :pkgname "auto-complete/auto-complete" :depends
                       (popup)
                       :features
                       (auto-complete-config)
                       :after nil))
 (cl-lib status "installed" recipe
         (:name cl-lib :builtin "24.3" :type elpa :description "Properly prefixed CL functions and macros" :url "http://elpa.gnu.org/packages/cl-lib.html"))
 (company status "required" recipe nil)
 (company-go status "installed" recipe
             (:name company-go :url "https://raw.githubusercontent.com/nsf/gocode/master/emacs-company/company-go.el" :type http :features
                    (company-go)
                    :after nil))
 (company-mode status "installed" recipe
               (:name company-mode :type github :pkgname "company-mode/company-mode" :features
                      (company)
                      :after nil))
 (dash status "installed" recipe
       (:name dash :description "A modern list api for Emacs. No 'cl required." :type github :pkgname "magnars/dash.el"))
 (el-get status "installed" recipe
         (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "master" :pkgname "dimitri/el-get" :info "." :compile
                ("el-get.*\\.el$" "methods/")
                :features el-get :post-init
                (when
                    (memq 'el-get
                          (bound-and-true-p package-activated-list))
                  (message "Deleting melpa bootstrap el-get")
                  (unless package--initialized
                    (package-initialize t))
                  (when
                      (package-installed-p 'el-get)
                    (let
                        ((feats
                          (delete-dups
                           (el-get-package-features
                            (el-get-elpa-package-directory 'el-get)))))
                      (el-get-elpa-delete-package 'el-get)
                      (dolist
                          (feat feats)
                        (unload-feature feat t))))
                  (require 'el-get))))
 (el-get-lock status "installed" recipe
              (:name el-get-lock :type github :pkgname "tarao/el-get-lock" :after nil))
 (emacs-company status "installed" recipe
                (:name emacs-company :url "https://raw.githubusercontent.com/nsf/gocode/master/emacs-company/company-go.el" :type http :features
                       (emacs-company)
                       :after nil))
 (emacs-jedi status "installed" recipe
             (:name emacs-jedi :type github :pkgname "tkf/emacs-jedi" :features
                    (company-jedi)
                    :after nil))
 (epl status "installed" recipe
      (:name epl :description "EPL provides a convenient high-level API for various package.el versions, and aims to overcome its most striking idiocies." :type github :pkgname "cask/epl"))
 (exec-path-from-shell status "installed" recipe
                       (:name exec-path-from-shell :features
                              (exec-path-from-shell)
                              :after nil :website "https://github.com/purcell/exec-path-from-shell" :description "Emacs plugin for dynamic PATH loading" :type github :pkgname "purcell/exec-path-from-shell"))
 (flycheck status "installed" recipe
           (:name flycheck :features
                  (flycheck)
                  :after nil :type github :pkgname "flycheck/flycheck" :minimum-emacs-version "24.3" :description "On-the-fly syntax checking extension" :build
                  '(("makeinfo" "-o" "doc/flycheck.info" "doc/flycheck.texi"))
                  :info "./doc" :depends
                  (dash pkg-info let-alist seq)))
 (fuzzy status "installed" recipe
        (:name fuzzy :website "https://github.com/auto-complete/fuzzy-el" :description "Fuzzy matching utilities for GNU Emacs" :type github :pkgname "auto-complete/fuzzy-el"))
 (go-autocomplete status "installed" recipe
                  (:name go-autocomplete :features
                         (go-autocomplete)
                         :after nil :description "An autocompletion daemon for the Go programming language." :type github :pkgname "nsf/gocode" :depends
                         (go-mode auto-complete)
                         :load-path
                         ("emacs")
                         :post-init
                         (progn
                           (add-to-list 'exec-path
                                        (expand-file-name "bin" default-directory))
                           (eval-after-load 'go-mode
                             '(require 'go-autocomplete)))))
 (go-mode status "installed" recipe
          (:name go-mode :features
                 (go-mode)
                 :after nil :description "Major mode for the Go programming language" :type github :pkgname "dominikh/go-mode.el"))
 (gocode status "installed" recipe
         (:name gocode :type github :pkgname "nsf/gocode" :features
                (emacs-company)
                :after nil))
 (hc-zenburn-emacs status "installed" recipe
                   (:name hc-zenburn-emacs :type github :pkgname "edran/hc-zenburn-emacs" :features
                          (hc-zenburn-theme)
                          :after nil))
 (hc-zenburn-theme status "installed" recipe
                   (:name hc-zenburn-theme :type elpa :features
                          (hc-zenburn-theme)
                          :after nil))
 (init-loader status "installed" recipe
              (:name init-loader :after nil :website "https://github.com/emacs-jp/init-loader" :description "It enables you to categorize your configurations and separate them into multiple files." :type github :pkgname "emacs-jp/init-loader"))
 (js2-mode status "installed" recipe
           (:name js2-mode :features
                  (js2-mode)
                  :after nil :website "https://github.com/mooz/js2-mode#readme" :description "An improved JavaScript editing mode" :type github :pkgname "mooz/js2-mode" :prepare
                  (autoload 'js2-mode "js2-mode" nil t)))
 (let-alist status "installed" recipe
            (:name let-alist :description "Easily let-bind values of an assoc-list by their names." :builtin "25.0.50" :type elpa :url "https://elpa.gnu.org/packages/let-alist.html"))
 (magit status "installed" recipe
        (:name magit :type github :pkgname "magit/magit" :features
               (magit)
               :after nil))
 (nsf/gocode/emacs-company status "required" recipe nil)
 (package status "installed" recipe
          (:name package :description "ELPA implementation (\"package.el\") from Emacs 24" :builtin "24" :type http :url "http://repo.or.cz/w/emacs.git/blob_plain/ba08b24186711eaeb3748f3d1f23e2c2d9ed0d09:/lisp/emacs-lisp/package.el" :shallow nil :features package :post-init
                 (progn
                   (let
                       ((old-package-user-dir
                         (expand-file-name
                          (convert-standard-filename
                           (concat
                            (file-name-as-directory default-directory)
                            "elpa")))))
                     (when
                         (file-directory-p old-package-user-dir)
                       (add-to-list 'package-directory-list old-package-user-dir)))
                   (setq package-archives
                         (bound-and-true-p package-archives))
                   (mapc
                    (lambda
                      (pa)
                      (add-to-list 'package-archives pa 'append))
                    '(("ELPA" . "http://tromey.com/elpa/")
                      ("melpa" . "http://melpa.org/packages/")
                      ("gnu" . "http://elpa.gnu.org/packages/")
                      ("marmalade" . "http://marmalade-repo.org/packages/")
                      ("SC" . "http://joseito.republika.pl/sunrise-commander/"))))))
 (pkg-info status "installed" recipe
           (:name pkg-info :description "Provide information about Emacs packages." :type github :pkgname "lunaryorn/pkg-info.el" :depends
                  (dash epl)))
 (popup status "installed" recipe
        (:name popup :website "https://github.com/auto-complete/popup-el" :description "Visual Popup Interface Library for Emacs" :type github :submodule nil :depends cl-lib :pkgname "auto-complete/popup-el"))
 (python-mode status "required" recipe nil)
 (react-snippets\.el status "installed" recipe
                     (:name react-snippets\.el :type github :pkgname "johnmastro/react-snippets.el" :features
                            (react-snippets)
                            :after nil))
 (seq status "installed" recipe
      (:name seq :description "Sequence manipulation library for Emacs" :builtin "25" :type github :pkgname "NicolasPetton/seq.el"))
 (tide status "required" recipe nil)
 (typescript-mode status "required" recipe nil)
 (typescript\.el status "installed" recipe
                 (:name typescript\.el :type github :pkgname "ananthakumaran/typescript.el" :features
                        (typescript-mode)
                        :after nil))
 (web-mode status "installed" recipe
           (:name web-mode :features
                  (web-mode)
                  :after nil :description "emacs major mode for editing PHP/JSP/ASP HTML templates (with embedded CSS and JS blocks)" :type github :pkgname "fxbois/web-mode")))
