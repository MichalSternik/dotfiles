;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     yaml
     rust
     lua
     git
     go
     html
     python
     javascript
     helm
     emacs-lisp
     (clojure :variables
              clojure-enable-fancify-symbols t)
     emacs-lisp
     (ruby :variables
           ruby-test-runner 'rspec)
     scheme
     (auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-enable-snippets-in-popup t)
     themes-megapack
     theming
     (evil-snipe :variables evil-snipe-enable-alternate-f-and-t-behaviors t)
     (shell :variables
            shell-default-height 30
            shell-default-position 'right
            shell-default-shell 'eshell)
     (org :variables
          org-enable-github-support t)
     markdown
     fasd
     (c-c++ :variables
            c-c++-enable-clang-support t)
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      go
                                      color-theme-solarized
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(
                                    solarized-theme
                                    )
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 10
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update t
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 3
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         spacemacs-light
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("PT Mono"
                               :size 23
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ";"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ t
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'current
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "ack" "pt" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'all

   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; Proper colorscheme:

  (setq theming-modifications '(('solarized
                                 (mode-line :foreground "#e9e2cb" :background "#2075c7" :inverse-video nil)
                                 (powerline-active1 :foreground "#e9e2cb" :background "#2075c7" :inverse-video nil)
                                 (powerline-active2 :foreground "#e9e2cb" :background "#2075c7" :inverse-video nil)
                                 (mode-line-inactive :foreground "#2075c7" :background "#e9e2cb" :inverse-video nil)
                                 (powerline-inactive1 :foreground "#2075c7" :background "#e9e2cb" :inverse-video nil)
                                 (powerline-inactive2 :foreground "#2075c7" :background "#e9e2cb" :inverse-video nil)
                                 (helm-selection :foreground "white" :background "red" :inverse-video nil)
                                 (cursor :background "#b58900"))))
  (add-to-list 'default-frame-alist
               '(background-mode . light))
  (setq frame-background-mode 'light)
  (spacemacs/load-theme 'solarized)

  ;; Pretty lambda:

  (defun pretty-lambda ()
    "make some word or string show as pretty Unicode symbols"
    (setq prettify-symbols-alist '(("lambda" . 955))))

  (add-hook 'racket-mode-hook 'pretty-lambda)
  (add-hook 'scheme-mode-hook 'pretty-lambda)
  (global-prettify-symbols-mode 1)

  ;; Custom key setup:

  ;; DEL to clear search highlights
  (define-key evil-normal-state-map (kbd "DEL")
    (lambda ()
      (interactive)
      (call-interactively 'spacemacs/evil-search-clear-highlight)))

  ;; RET to insert a newline below. Useful with evaluating last sexp.
  (define-key evil-normal-state-map (kbd "RET")
    (lambda ()
      (interactive)
      (call-interactively 'spacemacs/evil-insert-line-below)
      (evil-next-line)))

  ;; More emacsy insert mode keybidings - like ones in a shell

  (define-key evil-insert-state-map (kbd "C-h")
    (lambda ()
      (interactive)
      (call-interactively 'sp-backward-delete-char)))

  (define-key evil-insert-state-map (kbd "C-p")
    (lambda ()
      (interactive)
      (call-interactively 'evil-previous-line)))

  (define-key evil-insert-state-map (kbd "C-n")
    (lambda ()
      (interactive)
      (call-interactively 'evil-next-line)))

  (define-key evil-insert-state-map (kbd "C-a")
    (lambda ()
      (interactive)
      (call-interactively 'move-beginning-of-line)))

  (define-key evil-insert-state-map (kbd "C-e")
    (lambda ()
      (interactive)
      (call-interactively 'move-end-of-line)))

  (define-key evil-insert-state-map (kbd "C-k")
    (lambda ()
      (interactive)
      (call-interactively 'kill-line)))

  ;; Proper suspend frame, working just like everywhere else
  (define-key evil-normal-state-map (kbd "C-z")
    (lambda ()
      (interactive)
      (call-interactively 'suspend-frame)))

  ;; kill forward char in insert mode
  (define-key evil-insert-state-map (kbd "C-d")
    (lambda ()
      (interactive)
      (call-interactively 'sp-delete-char)))

  ;; Avy go to subword, because I use C-d and C-u to move
  ;; by screen anyway
  ;; Think C-FIND
  (define-key evil-normal-state-map (kbd "C-f")
    (lambda ()
      (interactive)
      (call-interactively 'avy-goto-word-or-subword-1)))

  ;; avy go to line, because since i broke one keymap,
  ;; i have second to pair left

  (define-key evil-normal-state-map (kbd "C-n")
    (lambda ()
      (interactive)
      (call-interactively 'avy-goto-line)))

  ;; nicer lisp writing - no more reaching for insert-paren

  (define-key evil-insert-state-map (kbd "M-a")
    (lambda ()
      (interactive)
      (call-interactively 'sp-wrap)))

  ;; Keybidings to do faster do stuff that happens often.

  (define-key evil-normal-state-map (kbd "gf")
    (lambda ()
      (interactive)
      (call-interactively 'ido-find-file)))

  (define-key evil-normal-state-map (kbd "gb")
    (lambda ()
      (interactive)
      (call-interactively 'helm-buffers-list)))

  ;; Varia:

  ;; Snipe config
  (evil-snipe-mode 1)
  (evil-snipe-override-mode 1)

  ;; GEISER Setup
  (setq geiser-active-implementations '(chez racket))
  (setq geiser-repl-autodoc-p 1)
  (setq geiser-mode-smart-tab-p t)
  (setq geiser-repl-query-on-kill-p nil)
  (setq geiser-debug-jump-to-debug-p nil)
  (setq geiser-implementations-alist
        '(((regexp "\\.scm$") chez)
         ((regexp "\\.ss$") chez)
         ((regexp "\\.rkt$") racket)))

  ;; Nice line wrapping:
  (add-hook 'org-mode-hook 'spacemacs/toggle-visual-line-navigation-on)
  (add-hook 'markdown-mode-hook 'spacemacs/toggle-visual-line-navigation-on)
  (add-hook 'org-mode-hook 'spacemacs/toggle-visual-line-navigation-on)
  (add-hook 'enh-ruby-mode-hook 'spacemacs/toggle-visual-line-navigation-on)
  (add-hook 'clojure-mode-hook 'spacemacs/toggle-visual-line-navigation-on)
  (add-hook 'scheme-mode-hook 'spacemacs/toggle-visual-line-navigation-on)
  (add-hook 'ruby-mode-hook 'spacemacs/toggle-visual-line-navigation-on)

  ;; Proper text width - mutt compatible
  (add-hook 'text-mode-hook        #'turn-on-auto-fill)
  (setq-default fill-column 80)

  ;; Various toggles:
  (global-company-mode)
  (setq powerline-default-separator 'arrow)
  (spacemacs/toggle-highlight-current-line-globally-off)
  (spacemacs/toggle-aggressive-indent-globally-on)
  (add-hook 'org-mode-hook 'org-toggle-pretty-entities 1)
  (rainbow-delimiters-mode-enable)
  (spacemacs/toggle-indent-guide-globally-off)
  (spacemacs/toggle-highlight-current-line-globally-off)
  (spacemacs/toggle-truncate-lines-on)
  (setq split-height-threshold nil)
  (setq split-width-threshold 0)
  (spacemacs/toggle-golden-ratio-on)
  (spacemacs/toggle-mode-line-minor-modes-off)
  (global-highlight-parentheses-mode)
  (spacemacs/toggle-auto-fill-mode-on)
  (spacemacs/toggle-centered-point-globally-on)

  (add-to-list 'auto-mode-alist '("/mutt" . mail-mode))

  ;; just to complete koans!
  (defun go-koans-run ()
    "Running Go koans test from"
    (interactive)
    (save-buffer)
    (setq output (shell-command-to-string "go test"))

    (with-current-buffer (get-buffer-create "*go-koans*")
      (erase-buffer)
      (insert output))


    (when (string-match "\\(about_[A-Za-z0-9_]*.go\\):\\([0-9]+\\)" output)

      (let
          ((line (string-to-int (match-string 2 output)))
           (file (expand-file-name (match-string 1 output))))

        (find-file (expand-file-name file))
        (goto-line line)


        ;; if expand region exists run it
        ;; if you don't have it https://github.com/magnars/expand-region.el
        (if (fboundp 'er/expand-region)
            (search-forward "__")
          (er/expand-region 1)))))


  (eval-after-load 'go-mode
    '(define-key go-mode-map (kbd "C-c C-r") 'go-koans-run))

  (provide 'go-koans)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#bcbcbc" "#d70008" "#5faf00" "#875f00" "#268bd2" "#800080" "#008080" "#5f5f87"])
 '(evil-want-Y-yank-to-eol t)
 '(package-selected-packages
   (quote
    (yaml-mode toml-mode racer pos-tip cargo rust-mode extempore-mode zenburn-theme zen-and-art-theme yapfify xterm-color ws-butler winum white-sand-theme which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spaceline spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode shell-pop seti-theme scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe reverse-theme restart-emacs rebecca-theme rbenv rake rainbow-delimiters railscasts-theme pyvenv pytest pyenv-mode py-isort purple-haze-theme pug-mode professional-theme popwin planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode paradox ox-gfm orgit organic-green-theme org-projectile org-present org-pomodoro org-mime org-download org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme neotree naquadah-theme mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minitest minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow madhat2r-theme macrostep lush-theme lua-mode lorem-ipsum livid-mode live-py-mode linum-relative link-hint light-soap-theme less-css-mode json-mode js2-refactor js-doc jbeans-theme jazz-theme ir-black-theme inkpot-theme indent-guide hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio go-guru go-eldoc go gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md geiser gandalf-theme fuzzy flx-ido flatui-theme flatland-theme fill-column-indicator fasd farmhouse-theme fancy-battery eyebrowse expand-region exotica-theme exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-snipe evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu espresso-theme eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav dumb-jump dracula-theme django-theme disaster define-word darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme company-web company-tern company-statistics company-go company-c-headers company-anaconda column-enforce-mode color-theme-solarized color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode cmake-mode clues-theme clojure-snippets clj-refactor clean-aindent-mode clang-format cider-eval-sexp-fu chruby cherry-blossom-theme busybee-theme bundler bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
