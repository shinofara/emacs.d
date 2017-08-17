((ac-python status "installed" recipe
            (:name ac-python :features
                   (ac-python)
                   :after nil :depends
                   (auto-complete)
                   :description "Simple Python Completion Source for Auto-Complete" :type http :url "http://chrispoole.com/downloads/ac-python.el" :checksum "ad0eb870829b4113b988ce7be00e7fef0953d1bb"))
 (auto-complete status "installed" recipe
                (:name auto-complete :website "https://github.com/auto-complete/auto-complete" :description "The most intelligent auto-completion extension." :type github :pkgname "auto-complete/auto-complete" :depends
                       (popup fuzzy)
                       :features auto-complete-config :post-init
                       (progn
                         (add-to-list 'ac-dictionary-directories
                                      (expand-file-name "dict" default-directory))
                         (ac-config-default))
                       :checksum "2e83566ddfa758c69afe50b8a1c62a66f47471e3"))
 (cl-lib status "installed" recipe
         (:name cl-lib :builtin "24.3" :type elpa :description "Properly prefixed CL functions and macros" :url "http://elpa.gnu.org/packages/cl-lib.html"))
 (company-go status "installed" recipe
             (:name company-go :url "https://raw.githubusercontent.com/nsf/gocode/master/emacs-company/company-go.el" :type http :features
                    (company-go)
                    :after nil :checksum "6d0461ee42ef77138248430228a68ccb68c18138"))
 (company-jedi status "installed" recipe
               (:name company-jedi :depends
                      (jedi-core company-mode)
                      :features
                      (company-jedi)
                      :after nil :description "Company backend for Python jedi." :website "https://github.com/syohex/emacs-company-jedi" :type github :pkgname "syohex/emacs-company-jedi"))
 (company-mode status "installed" recipe
               (:name company-mode :type github :pkgname "company-mode/company-mode" :features
                      (company)
                      :after nil :checksum "bc2ce4e23ff2a3bd4a8ffa766acc5efb0643a7d1"))
 (ctable status "installed" recipe
         (:name ctable :description "Table Component for elisp" :type github :pkgname "kiwanami/emacs-ctable" :checksum "cd673a09a80ce4e9e102ffe2e3d7e6bfb9d652b0"))
 (dash status "installed" recipe
       (:checksum "98e819e407bbc35478cde30a74be15f077bd6d4b" :name dash :features
                  (dash)
                  :after nil :description "A modern list api for Emacs. No 'cl required." :type github :pkgname "magnars/dash.el"))
 (deferred status "installed" recipe
   (:name deferred :description "Simple asynchronous functions for emacs lisp." :type github :pkgname "kiwanami/emacs-deferred" :checksum "d012a1ab50edcc2c44e3e49006f054dbff47cb6c"))
 (dockerfile-mode status "installed" recipe
                  (:name dockerfile-mode :features
                         (dockerfile-mode)
                         :after nil :description "An emacs mode for handling Dockerfiles." :type github :pkgname "spotify/dockerfile-mode" :prepare
                         (progn
                           (add-to-list 'auto-mode-alist
                                        '("Dockerfile\\'" . dockerfile-mode)))
                         :checksum "5f1e17e4e59fee4725c5b4cd9b5b49f1faaa108f"))
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
              (:name el-get-lock :type github :pkgname "tarao/el-get-lock" :features
                     (el-get-lock)
                     :after nil :checksum "df8cfe55441695865a64b97946750b6413a40425"))
 (emacs-async status "installed" recipe
              (:name emacs-async :description "Simple library for asynchronous processing in Emacs" :type github :pkgname "jwiegley/emacs-async" :checksum "09a177c15bd3aafc57ba6a63ab093f640ffa2610"))
 (epc status "installed" recipe
      (:name epc :description "An RPC stack for Emacs Lisp" :type github :pkgname "kiwanami/emacs-epc" :depends
             (deferred ctable)
             :checksum "76fe6847a341f78c635164c18908a0b691f7212c"))
 (epl status "installed" recipe
      (:name epl :description "EPL provides a convenient high-level API for various package.el versions, and aims to overcome its most striking idiocies." :type github :pkgname "cask/epl" :checksum "a5ad061d0a5eb42f66c384e55d102da7d52c96b0"))
 (exec-path-from-shell status "installed" recipe
                       (:name exec-path-from-shell :features
                              (exec-path-from-shell)
                              :after nil :website "https://github.com/purcell/exec-path-from-shell" :description "Emacs plugin for dynamic PATH loading" :type github :pkgname "purcell/exec-path-from-shell" :checksum "c6eedaf916f763a68cbb7fdaf9c7af568546d4b9"))
 (flycheck status "installed" recipe
           (:name flycheck :features
                  (flycheck)
                  :after nil :depends
                  (seq let-alist pkg-info dash)
                  :type github :pkgname "flycheck/flycheck" :minimum-emacs-version "24.3" :description "On-the-fly syntax checking extension" :checksum "da499ef6a7e3c8f4adec732703f34aea2a4e70a2"))
 (fuzzy status "installed" recipe
        (:name fuzzy :website "https://github.com/auto-complete/fuzzy-el" :description "Fuzzy matching utilities for GNU Emacs" :type github :pkgname "auto-complete/fuzzy-el" :checksum "534d723ad2e06322ff8d9bd0ba4863d243f698e7"))
 (go-guru status "installed" recipe
          (:name go-guru :type http :url "https://raw.githubusercontent.com/dominikh/go-mode.el/master/go-guru.el" :after nil :checksum "2939567ef6cea8fdc169e3bb848bfa5474777b9b"))
 (go-mode status "installed" recipe
          (:name go-mode :features
                 (go-mode)
                 :after nil :description "Major mode for the Go programming language" :type github :pkgname "dominikh/go-mode.el" :checksum "5056b857a90d732d78162b3263a1dd94f7c5afe3"))
 (hc-zenburn-emacs status "installed" recipe
                   (:name hc-zenburn-emacs :type github :pkgname "edran/hc-zenburn-emacs" :features
                          (hc-zenburn-theme)
                          :after nil :checksum "fd0024a5191cdce204d91c8f1db99ba31640f6e9"))
 (hc-zenburn-theme status "installed" recipe
                   (:name hc-zenburn-theme :type elpa :after nil))
 (init-loader status "installed" recipe
              (:name init-loader :after nil :website "https://github.com/emacs-jp/init-loader" :description "It enables you to categorize your configurations and separate them into multiple files." :type github :pkgname "emacs-jp/init-loader" :checksum "287da99eadfa3dd85492506db43d68324069b593"))
 (jedi-core status "installed" recipe
            (:name jedi-core :type github :pkgname "tkf/emacs-jedi" :description "Python jedi core functionality for Emacs. Required for company-jedi" :minimum-emacs-version "24" :compile "jedi-core.el" :depends
                   (epc python-environment cl-lib)
                   :checksum "b0764f425766786dfb1bff910ed1d1670f11eb9c"))
 (jinja2-mode status "installed" recipe
              (:name jinja2-mode :features
                     (jinja2-mode)
                     :after nil :description "Jinja2 mode for emacs" :website "http://paradoxxxzero.github.com/jinja2-mode/" :type github :pkgname "paradoxxxzero/jinja2-mode" :checksum "cfaa7bbe7bb290cc500440124ce89686f3e26f86"))
 (let-alist status "installed" recipe
            (:name let-alist :description "Easily let-bind values of an assoc-list by their names." :builtin "25.0.50" :type elpa :url "https://elpa.gnu.org/packages/let-alist.html"))
 (magit status "installed" recipe
        (:name magit :features
               (magit)
               :after nil :depends
               (emacs-async with-editor dash)
               :website "https://github.com/magit/magit#readme" :description "It's Magit! An Emacs mode for Git." :type github :pkgname "magit/magit" :branch "master" :minimum-emacs-version "24.4" :info "Documentation" :load-path "lisp/" :compile "lisp/" :build
               `(("make" ,(format "EMACSBIN=%s" el-get-emacs)
                  "docs")
                 ("touch" "lisp/magit-autoloads.el"))
               :build/berkeley-unix
               `(("gmake" ,(format "EMACSBIN=%s" el-get-emacs)
                  "docs")
                 ("touch" "lisp/magit-autoloads.el"))
               :build/windows-nt
               (with-temp-file "lisp/magit-autoloads.el" nil)
               :checksum "ab9c189f619dd511724b8f3eaeaa2b9a606e2179"))
 (package status "installed" recipe
          (:name package :description "ELPA implementation (\"package.el\") from Emacs 24" :builtin "24" :type http :url "https://repo.or.cz/w/emacs.git/blob_plain/ba08b24186711eaeb3748f3d1f23e2c2d9ed0d09:/lisp/emacs-lisp/package.el" :features package :post-init
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
                   (let
                       ((protocol
                         (if
                             (and
                              (fboundp 'gnutls-available-p)
                              (gnutls-available-p))
                             "https://"
                           (lwarn
                            '(el-get tls)
                            :warning "Your Emacs doesn't support HTTPS (TLS)%s"
                            (if
                                (eq system-type 'windows-nt)
                                ",\n  see https://github.com/dimitri/el-get/wiki/Installation-on-Windows." "."))
                           "http://"))
                        (archives
                         '(("melpa" . "melpa.org/packages/")
                           ("gnu" . "elpa.gnu.org/packages/")
                           ("marmalade" . "marmalade-repo.org/packages/"))))
                     (dolist
                         (archive archives)
                       (add-to-list 'package-archives
                                    (cons
                                     (car archive)
                                     (concat protocol
                                             (cdr archive)))))))))
 (pkg-info status "installed" recipe
           (:name pkg-info :description "Provide information about Emacs packages." :type github :pkgname "lunaryorn/pkg-info.el" :depends
                  (dash epl)
                  :checksum "76ba7415480687d05a4353b27fea2ae02b8d9d61"))
 (popup status "installed" recipe
        (:name popup :website "https://github.com/auto-complete/popup-el" :description "Visual Popup Interface Library for Emacs" :type github :submodule nil :depends cl-lib :pkgname "auto-complete/popup-el" :checksum "80829dd46381754639fb764da11c67235fe63282"))
 (protobuf-mode status "installed" recipe
                (:name protobuf-mode :features
                       (protobuf-mode)
                       :after nil :website "https://developers.google.com/protocol-buffers/" :description "Major mode for editing protocol buffers." :type http :url "https://raw.githubusercontent.com/google/protobuf/master/editors/protobuf-mode.el" :checksum "dc27d96872b2992c7bbce151b627a0bfbd83e85d"))
 (python-environment status "installed" recipe
                     (:name python-environment :description "Python virtualenv API for Emacs Lisp" :type github :pkgname "tkf/emacs-python-environment" :depends
                            (deferred)
                            :checksum "401006584e32864a10c69d29f14414828909362e"))
 (python-mode status "required" recipe nil)
 (seq status "installed" recipe
      (:name seq :description "Sequence manipulation library for Emacs" :builtin "25" :type github :pkgname "NicolasPetton/seq.el"))
 (with-editor status "installed" recipe
   (:name with-editor :description "Use the Emacsclient as $EDITOR" :type github :pkgname "magit/with-editor" :checksum "3385ffdc6faed5a283e26a7ebf89825c700dd395"))
 (yaml-mode status "installed" recipe
            (:name yaml-mode :features
                   (yaml-mode)
                   :after nil :description "Simple major mode to edit YAML file for emacs" :type github :pkgname "yoshiki/yaml-mode" :checksum "1c3ade410fb0bf5b6f2140b099f0ef96836ee74e")))
