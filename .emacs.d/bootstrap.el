;; Bootstrapping code taken and modified from:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Sanemacs version 0.3.0 ;;;
;;; https://sanemacs.com   ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; For performance
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb


(add-hook 'after-init-hook #'(lambda ()
                               ;; restore after startup
                               (setq gc-cons-threshold 800000)))


(setq warning-minimum-level :emergency)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))



;;; Disable menu-bar, tool-bar, and scroll-bar.
;;(if (fboundp 'menu-bar-mode)
;;    (menu-bar-mode -1))
;;(if (fboundp 'tool-bar-mode)
;;    (tool-bar-mode -1))
;;(if (fboundp 'scroll-bar-mode)
;;    (scroll-bar-mode -1))

(add-to-list 'initial-frame-alist '(fullscreen . fullheight))

(when (memq window-system '(mac ns))
  (add-to-list 'default-frame-alist '(ns-appearance . dark)) ; nil for dark text
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t)))



;;; Put Emacs auto-save and backup files to /tmp/ or C:/Temp/
(defconst emacs-tmp-dir (expand-file-name (format "emacs%d" (user-uid)) temporary-file-directory))
(setq
   backup-by-copying t                                        ; Avoid symlinks
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t
   auto-save-list-file-prefix emacs-tmp-dir
   auto-save-file-name-transforms `((".*" ,emacs-tmp-dir t))  ; Change autosave dir to tmp
   backup-directory-alist `((".*" . ,emacs-tmp-dir)))

;;; Lockfiles unfortunately cause more pain than benefit
(setq create-lockfiles nil)

(setq org-roam-v2-ack t)

(straight-use-package 'org)

(use-package org
  :ensure org-contrib
  ;; The rest of your org-mode configuration
)


(org-babel-load-file
 (expand-file-name
  "config.org"
  user-emacs-directory))


;;(defun reload-config ()
;;  (interactive)
;;  (load-file (concat user-emacs-directory "init.el")))
