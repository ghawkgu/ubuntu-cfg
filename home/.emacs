(server-start)
(add-to-list 'load-path "~/.emacs.d/")

;===========ibus=====================
;(require 'ibus)
;(add-hook 'after-init-hook 'ibus-mode-on)
;(setq ibus-agent-file-name "/home/george/bin/ibus-el-agent")

(prefer-coding-system 'utf-8-unix)
(setq default-major-mode 'text-mode);默认text模式
(setq initial-major-mode 'text-mode);默认text模式
;;(setq-default show-trailing-whitespace t);;显示尾部空格，可以用delete-trailing-space删掉尾部空格
(setq initial-scratch-message nil) ;取消初始化buffer里的文本
(setq line-move-visual nil) ;使用v23以前的C-n和C-p风格

;;不产生备份文件
(setq make-backup-files nil)
(global-font-lock-mode t);语法高亮
(global-hl-line-mode t);高亮当前行
(auto-image-file-mode t);打开图片显示功能
(fset 'yes-or-no-p 'y-or-n-p);以 y/n代表 yes/no，可能你觉得不需要，呵呵。
(column-number-mode t);显示列号
(show-paren-mode t);显示括号匹配
(display-time-mode 1);显示时间，格式如下
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(tool-bar-mode -1);去掉那个大大的工具栏
;(scroll-bar-mode nil);去掉滚动条，因为可以使用鼠标滚轮了 ^_^
(mouse-avoidance-mode 'animate);光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线。很好玩阿，这个功能
(setq mouse-yank-at-point t);支持中键粘贴
(transient-mark-mode t);高亮显示选中区域
(setq x-select-enable-clipboard t);支持emacs和外部程序的粘贴
;(setq frame-title-format "zhan@%b");在标题栏提示你目前在什么位置。你要把zhan改成自己的用户名
;; set frame height and width
(add-to-list 'default-frame-alist '(width . 150)) ; 100 columns
(add-to-list 'default-frame-alist '(height . 40)) ; 47 lines
(setq default-fill-column 80);默认显示 80列就换行
;;关闭开启画面
(setq inhibit-startup-message t)
;;用空格代替tab
(setq-default indent-tabs-mode nil)
;;设置TAB宽度为4
;(setq default-tab-width 4)
(setq-default tab-width 4)
;;以下设置缩进

(setq c-indent-level 4)
(setq c-continued-statement-offset 4)
(setq c-brace-offset -4)
(setq c-argdecl-indent 4)
(setq c-label-offset -4)
(setq c-basic-offset 4)
;(global-set-key "\C-m" 'reindent-then-newline-and-indent)
(setq standard-indent 4)

;显示行号 linum从emacs22开始已经集成了
;(require 'linum)
(setq linum-format "%7d|") ;;行号格式
(global-linum-mode 1)
;(add-hook 'find-file-hook (lambda () (linum-mode 1)))



;;==================c-mode代码风格==========================
(add-hook 'c-mode-hook
    '(lambda ()
        (c-set-style "stroustrup")))

(add-hook 'c++-mode-hook
    '(lambda ()
        (c-set-style "stroustrup")))

;;gui下的专有配置, 比如xft字体, 启动最大化一类的配置写在这
(defun config-theme()
  (interactive)
(if (not window-system) nil ;限于图形模式
;;==================字体设置=================================
;;(set-default-font "DejaVu Sans Mono-12")
;;(set-default-font "Consolas-12")
;;(set-default-font "BitStream Vera Sans Mono-12")
;;(set-default-font "Monospace-10")
;;(set-default-font "Droid Sans Mono-12")
(set-default-font "WenQuanYi Zen Hei Mono-12")
;;(set-default-font "IPAGothic-12")
;;(set-default-font "MingLiu-12")
;;(set-default-font "WenQuanYi Bitmap Song-12")

;;(set-fontset-font (frame-parameter nil 'font)
;;                      'han '("STHeiti" . "unicode-bmp"))
;;(set-fontset-font (frame-parameter nil 'font)
;;                      'cjk-misc '("M+2P+IPAG circle" . "unicode-bmp"))
;;(set-fontset-font (frame-parameter nil 'font)
;;          'symbol '("M+2P+IPAG circle" . "unicode-bmp"))
;;(set-fontset-font (frame-parameter nil 'font)
;;          'kana '("M+2P+IPAG circle" . "unicode-bmp"))
(set-fontset-font (frame-parameter nil 'font)
            'han '("WenQuanYi Micro Hei Mono" . "unicode-bmp"))
(set-fontset-font (frame-parameter nil 'font)
            'cjk-misc '("WenQuanYi Micro Hei Mono" . "unicode-bmp"))
(set-fontset-font (frame-parameter nil 'font)
            'symbol '("WenQuanYi Micro Hei Mono" . "unicode-bmp"))
(set-fontset-font (frame-parameter nil 'font)
            'kana '("WenQuanYi Micro Hei Mono" . "unicode-bmp"))

) ;以上限于图形模式

;;===================设置配色方案===========================
(setq load-path (append load-path '("~/.emacs.d/color-theme")))
(require 'color-theme)
(color-theme-initialize)
;(color-theme-deep-blue)
(color-theme-ir-black)

) ;config-theme
(config-theme)

;; 修正服务模式下的界面配置错误问题
(add-hook 'after-make-frame-functions
          (lambda (new-frame)
            (select-frame new-frame)
            (tool-bar-mode 0)
            (config-theme)
;            (require 'tabbar)
;            (tabbar-mode t)
))

;;=========================显示空白模式==============================
;; make whitespace-mode use “¶” for newline and “▷” for tab.
;; together with the rest of its defaults
(setq whitespace-display-mappings
 '(
   (space-mark 32 [32] [46]) ; normal space default is 183
   (space-mark 160 [164] [95])
   (space-mark 2208 [2212] [95])
   (space-mark 2336 [2340] [95])
   (space-mark 3616 [3620] [95])
   (space-mark 3872 [3876] [95])
   (newline-mark 10 [8629 10]) ; newlne
   (tab-mark 9 [8614 9] [92 9]) ; tab
))

;; Glyph	Number	Unicode Char Name
;=====================================================
;; 中文
;;
;; ·	183     MIDDLE DOT
;; ¶	182	    PILCROW SIGN
;; ↵	8629	DOWNWARDS ARROW WITH CORNER LEFTWARDS
;; ▷	9655	WHITE RIGHT POINTING TRIANGLE
;; ▶	9654	BLACK RIGHT-POINTING TRIANGLE
;; →	8594	RIGHTWARDS ARROW
;; ↦	8614	RIGHTWARDS ARROW FROM BAR
;; ⇥	8677	RIGHTWARDS ARROW TO BAR
;; ˽ 	765     MODIFIER LETTER SHELF
;; $    36      DOLLAR SIGN

;;===================第三方提供的功能====================================
;;; use groovy-mode when file ends in .groovy or has #!/bin/groovy at start
(autoload 'groovy-mode "groovy-mode" "Groovy editing mode." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

;自动识别编码
(require 'unicad)

;;===================TeX模式设置============================
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(add-hook 'LaTeX-mode-hook
    (lambda()
        (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
            (setq TeX-command-default "XeLaTeX")
;               (setq TeX-save-query  nil )
                (setq TeX-show-compilation t)
))
;;===================Python模式============================
;(require 'auto-complete-yasnippet)
;(load-library "init-python")
;(require 'python-mode)

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

;;vvvvvvvvvvvvvvvvvvvvvvv  Initialized by auto-complete  vvvvvvvvvvv
;; Initialize Pymacs                                                                                           
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
;; Initialize Rope                                                                                             
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)
;;^^^^^^^^^^^^^^^^^^^^^^^  Initialized by auto-complete  ^^^^^^^^^^^

;;===================Javascript模式========================
(autoload #'espresso-mode "espresso" "Start espresso-mode" t)
(add-to-list 'auto-mode-alist '("\\.js$" . espresso-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . espresso-mode))

;;===================Ruby模式==============================
(autoload 'ruby-mode "ruby-mode"
      "Mode for editing ruby source files" t)
    (setq auto-mode-alist
          (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
    (setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
                                  interpreter-mode-alist))

    (autoload 'run-ruby "inf-ruby"
      "Run an inferior Ruby process")
    (autoload 'inf-ruby-keys "inf-ruby"
      "Set local key defs for inf-ruby in ruby-mode")
    (add-hook 'ruby-mode-hook
          '(lambda ()
             (inf-ruby-keys)
    ))

;;===============Markdown模式=============================
(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)
(setq auto-mode-alist
   (cons '("\\.text" . markdown-mode) auto-mode-alist))


;;================TABBAR设置=====================================
(require 'tabbar)
(tabbar-mode t)
;;(global-set-key [(control shift tab)] 'tabbar-backward)
;;(global-set-key [(control tab)]       'tabbar-forward)
(global-set-key (kbd "s-[") 'tabbar-backward)
(global-set-key (kbd "s-]") 'tabbar-forward)
;(global-set-key (kbd "M-p") 'tabbar-backward-tab)
;(global-set-key (kbd "M-n") 'tabbar-forward-tab)

;;(when (require ‘tabbar nil t)
      (setq tabbar-buffer-groups-function
          (lambda (b) (list "All Buffers")))
      (setq tabbar-buffer-list-function
          (lambda ()
              (remove-if
                  (lambda(buffer)
                      (find (aref (buffer-name buffer) 0) " *"))
                      (buffer-list))))
;;      (tabbar-mode))

;;================类似eclipse的上下移动整行功能=====================
(defun move-line (n)
  "Move the current line up or down by N lines."
  (interactive "p")
  (setq col (current-column))
  (beginning-of-line) (setq start (point))
  (end-of-line) (forward-char) (setq end (point))
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (insert line-text)
    ;; restore point to original column in moved line
    (forward-line -1)
    (forward-char col)))

(defun move-line-up (n)
  "Move the current line up by N lines."
  (interactive "p")
  (move-line (if (null n) -1 (- n))))

(defun move-line-down (n)
  "Move the current line down by N lines."
  (interactive "p")
  (move-line (if (null n) 1 n)))


;; copy line
;;(defun kill-ring-save-current-line ()
;;  "copy the current non-empty line to the kill-ring"
;;  (interactive)
;;  (unless (equal (line-beginning-position) (line-end-position))
;;    (kill-ring-save (line-beginning-position) (line-end-position))))

;; bind it
;;(global-set-key [(control \;)] 'kill-ring-save-current-line)

(defun dup-line-down ()                  ;;复制本行到下一行
  "Duplicate this line at next line"
  (interactive)
  (let ((c (current-column)))
    (beginning-of-line)
    (ue-select-line-down)
    (beginning-of-line)
    (yank)
    (previous-line 1)
    (move-to-column c)))

(defun ue-select-line-down ()
  "like Shift+down in UltraEdit."
  (interactive)
  (let ((s (point)))
  (setq next-line-add-newlines t)
  (next-line 1)
  (setq next-line-add-newlines nil)
  (kill-new (buffer-substring s (point)))))


(global-set-key (kbd "M-<up>") 'move-line-up)
(global-set-key (kbd "M-<down>") 'move-line-down)
(global-set-key (kbd "C-M-<down>") 'dup-line-down)

;;================CDEDT===================================
;;(setq load-path (append load-path '("/usr/local/share/emacs/site-lisp")))
;(load-file "~/.emacs.d/cedet/common/cedet.el")
(load-file "~/.emacs.d/cedet/common/cedet.el")
;(require 'cedet)
;; Enable EDE (Project Management) features
(global-ede-mode 1)

;; Enable EDE for a pre-existing C++ project
;;(ede-cpp-root-project "NAME" :file "~/myproject/Makefile")


;; ;; Enabling Semantic (code-parsing, smart completion) features
;; ;; Select one of the following:
;;
;; ;; * This enables the database and idle reparse engines
(semantic-load-enable-minimum-features)
;;
;; ;; * This enables some tools useful for coding, such as summary mode
;; ;;   imenu support, and the semantic navigator
(semantic-load-enable-code-helpers)
;;
;; ;; * This enables even more coding tools such as intellisense mode
;; ;;   decoration mode, and stickyfunc mode (plus regular code helpers)
(semantic-load-enable-gaudy-code-helpers)
;;
;; ;; * This enables the use of Exuberent ctags if you have it installed.
;; ;;   If you use C++ templates or boost, you should NOT enable it.
(semantic-load-enable-all-exuberent-ctags-support)
;;
;; ;; Enable SRecode (Template management) minor-mode.
(global-srecode-minor-mode 1)

(global-semantic-stickyfunc-mode nil)
;;
;;
;;
;;
;;================ECB设置================================
(add-to-list 'load-path  "~/.emacs.d/ecb")
(require 'ecb)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40"))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;===================Speedbar设置==========================
(require 'sr-speedbar)
(global-set-key (kbd "C-M-s") 'sr-speedbar-toggle)
(setq-default sr-speedbar-right-side nil)

;代码模板
(require 'yasnippet-bundle)

;自动完成
;(require 'auto-complete)
;(require 'auto-complete-yasnippet)
;(require 'auto-complete-config)
;(global-auto-complete-mode t)
;(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

(defun ac-python-mode-setup ()
    (setq ac-sources (append '(ac-source-yasnippet ac-source-ropemacs) ac-sources)))
(add-hook 'python-mode-hook 'ac-python-mode-setup)

;; emacsclient/server hook
  (defvar server-seb-mode-map
      (let ((map (make-sparse-keymap)))
            (define-key map "\C-xk"
                '(lambda ()
                       (interactive)
                           (shell-command (concat "touch " "/tmp/blah"))
                               (server-edit)))
                  map))
    (define-minor-mode server-seb-mode "Server")
      (add-hook 'server-visit-hook 'server-seb-mode)
