((company-go status "installed" recipe
             (:name company-go :url "https://raw.githubusercontent.com/nsf/gocode/master/emacs-company/company-go.el" :type http :features
                    (company-go)
                    :after nil :checksum "6d0461ee42ef77138248430228a68ccb68c18138"))
 (company-mode status "installed" recipe
               (:name company-mode :type github :pkgname "company-mode/company-mode" :features
                      (company)
                      :after nil :checksum "bc2ce4e23ff2a3bd4a8ffa766acc5efb0643a7d1"))
 (dash status "installed" recipe
       (:name dash :description "A modern list api for Emacs. No 'cl required." :type github :pkgname "magnars/dash.el" :checksum "98e819e407bbc35478cde30a74be15f077bd6d4b"))
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
 (let-alist status "installed" recipe
            (:name let-alist :description "Easily let-bind values of an assoc-list by their names." :builtin "25.0.50" :type elpa :url "https://elpa.gnu.org/packages/let-alist.html"))
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
 (seq status "installed" recipe
      (:name seq :description "Sequence manipulation library for Emacs" :builtin "25" :type github :pkgname "NicolasPetton/seq.el"))
 (yaml-mode status "installed" recipe
            (:name yaml-mode :features
                   (yaml-mode)
                   :after nil :description "Simple major mode to edit YAML file for emacs" :type github :pkgname "yoshiki/yaml-mode" :checksum "1c3ade410fb0bf5b6f2140b099f0ef96836ee74e")))
