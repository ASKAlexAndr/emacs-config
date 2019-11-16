((cmake-mode status "required" recipe nil)
 (coffee-mode status "required" recipe nil)
 (company-mode status "required" recipe nil)
 (dash status "required" recipe nil)
 (diminish status "required" recipe nil)
 (dockerfile-mode status "required" recipe nil)
 (drag-stuff status "required" recipe nil)
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
 (emacs-async status "required" recipe nil)
 (emmet-mode status "required" recipe nil)
 (epl status "required" recipe nil)
 (helm status "required" recipe nil)
 (helm-css-scss status "required" recipe nil)
 (jade-mode status "required" recipe nil)
 (js2-mode status "required" recipe nil)
 (json-mode status "required" recipe nil)
 (json-reformat status "required" recipe nil)
 (json-snatcher status "required" recipe nil)
 (markdown-mode status "required" recipe nil)
 (org-mode status "required" recipe nil)
 (php-mode status "required" recipe nil)
 (pkg-info status "required" recipe nil)
 (projectile status "required" recipe nil)
 (s status "required" recipe nil)
 (scss-mode status "required" recipe nil)
 (sml-modeline status "required" recipe nil)
 (undo-tree status "required" recipe nil)
 (web-mode status "required" recipe nil)
 (yaml-mode status "required" recipe nil)
 (yasnippet status "required" recipe nil))
