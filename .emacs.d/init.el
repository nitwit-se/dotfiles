;;; -*- lexical-binding: t -*-
(load "~/.emacs.d/bootstrap.el" nil t)

(set-language-environment "UTF-8")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("f366d4bc6d14dcac2963d45df51956b2409a15b770ec2f6d730e73ce0ca5c8a7" "5dbdb4a71a0e834318ae868143bb4329be492dd04bdf8b398fb103ba1b8c681a" "6bf841f77d5eb01455d82ae436e3e25277daaef4ee855a3572589dad1b3ac4b3" "72ed8b6bffe0bfa8d097810649fd57d2b598deef47c992920aef8b5d9599eefe" "2ff9ac386eac4dffd77a33e93b0c8236bb376c5a5df62e36d4bfa821d56e4e20" "91c008faf603a28d026957120a5a924a3c8fff0e12331abf5e04c0e9dd310c65" "0ed3d96a506b89c1029a1ed904b11b5adcebeb2e0c16098c99c0ad95cb124729" "b6c43bb2aea78890cf6bd4a970e6e0277d2daf0075272817ea8bb53f9c6a7f0a" "e7820b899036ae7e966dcaaec29fd6b87aef253748b7de09e74fdc54407a7a02" "1781e8bccbd8869472c09b744899ff4174d23e4f7517b8a6c721100288311fa5" "de8f2d8b64627535871495d6fe65b7d0070c4a1eb51550ce258cd240ff9394b0" "e9d47d6d41e42a8313c81995a60b2af6588e9f01a1cf19ca42669a7ffd5c2fde" "d43860349c9f7a5b96a090ecf5f698ff23a8eb49cd1e5c8a83bb2068f24ea563" "0f220ea77c6355c411508e71225680ecb3e308b4858ef6c8326089d9ea94b86f" default))
 '(safe-local-variable-values
   '((org-hugo-section . "cvwiki")
     (org-hugo-base-dir . "~/proj/hugo/climateos-wiki"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(italic ((t (:inherit nano-salient))))
 '(org-headline-done ((((class color) (min-colors 16) (background dark)) (:foreground "dim gray" :bold nil :strike-through t))))
 '(org-level-2 ((t (:inherit nano-default))))
 '(org-level-3 ((t (:inherit nano-default))))
 '(org-level-4 ((t (:inherit nano-default))))
 '(org-level-5 ((t (:inherit nano-default))))
 '(org-level-6 ((t (:inherit nano-default))))
 '(org-level-7 ((t (:inherit nano-default))))
 '(org-level-8 ((t (:inherit nano-default))))
 '(org-table ((t (:inherit nano-default)))))
