" vimrc
" vi: fdm=marker

" Use Vim settings, rather then Vi settings (much better!). (default)
" This must be first, because it changes other options as a side effect.
"set nocompatible

" only use mouse when in normal/command mode
set mouse=n
" use mouse all the time (default)
"if has('mouse')
	" when and where to use the mouse
	"" 'n'	: Normal mode
	"" 'v'	: Visual mode
	"" 'i'	: Insert mode
	"" 'c'	: Command-line mode
	"" 'h'	: all previous modes when editing a help file
	"" 'a'	: all previous modes
	"" 'r'	: for hit-enter and more-prompt prompt
	"set mouse=a

	" whether the window focus follows the mouse (default off)
	"" (I can see this becoming very annoying)
	"set nomousefocus
"endif " has('mouse')

" don't set the terminal title
" addendum: in a screen(1) session this means setting the text on the status
"	    bar, which is actually nice
"set notitle

" send more drawing commands to the terminal
set ttyfast

if !has('autocmd')
	" always set autoindenting on (default)
	"set autoindent
	" use smart indentation
	set smartindent

endif " has("autocmd")

"" overrides from using autocmd

" always keep a backup (default)
"set backup

" {{{BEGIN backupskip
" skip backing up of the following patterns
"set backupskip+=/tmp/*

"" udev rules
"" (complains if there are files in the directory not matching *.rules)
set backupskip+=/etc/udev/rules.d/*

"" Subversion commit log messages
set backupskip+=*/svn-commit.tmp

"" Slackware package special files
"" (if installed, will leave a rogue /install directory)
set backupskip+=*/install/slack-desc,*/install/slack-required,*/install/slack-suggests,*/install/doinst.sh

"" crontab files
"" (if left in the directory, they will execute twice)
set backupskip+=*/.cron/*/*

"" C-x C-e (bash)
set backupskip+=*/bash-fc-*

" }}}END backupskip

" keep vim swap files out of the current working directory
set directory=~/.vim/temp//

" chdir to match current buffer
set autochdir

" show line numbers
set number

" allow backspacing over everything in insert mode (default)
"set backspace=2

" keep 512 lines of command line history
set history=512

" number of undo levels (default)
"set undolevels=1000

" number of characters typed before swap file is written (default)
"set updatecount=200

" number of milliseconds in interval between swap file writes (default)
"set updatetime=4000

" show the cursor position all the time (default)
"set ruler

" display incomplete commands (default)
"set showcmd

" do incremental searching (default)
"set incsearch

" default ai- and gq-wrapping width
"set textwidth=79

" don't add two spaces after a sentence-ending mark when gq-ing and j-ing
set nojoinspaces

" automatically read a file if changed outside of vim (thanks vim-sensible)
set autoread

" (if terminal is capable of more than monochrome)
if has('gui_running') || &t_Co > 2
	" Switch syntax highlighting on when the terminal has colors (default)
	"syntax on
	" Also switch on highlighting the last used search pattern. (default)
	"set hlsearch
	" Removing search highlighting
	nnoremap <ESC><ESC> :nohlsearch<CR>

	"" color tweaks
	" 1-2: Show trailing whitespace and spaces before a tab:
	" 3: not so bright as to make comments disappear in evening colorscheme
	" 4: brighter cursor
	autocmd ColorScheme *		highlight ExtraWhitespace ctermbg=red guibg=red |
				\	match ExtraWhitespace /\s\+$\| \+\ze\t/ |
				\	hi CursorLine guibg=gray30 |
				\	hi Cursor guibg=lightgreen
	" Replace blinding gvim color scheme (makes terminal vim brighter)
	colorscheme evening
	" correct some colors
	" (addendum: only affects terminal vim, looks better regular)
	"highlight PreProc ctermfg=Magenta
endif " has('gui_running') || &t_Co > 2

" Fancy Plugin Options

"if exists(':Airline')
	" for airline
	set laststatus=2 noru
	if has('gui_running')
		set guifont=Terminess\ Powerline\ 9

		let g:airline_powerline_fonts=1
	endif " has('gui_running')
	let g:airline_theme='badwolf'
	let g:airline#extensions#tabline#enabled=1
	let g:airline#extensions#tabline#show_buffers=0
"endif " exists(':Airline')

" Unicode options
if has('multi_byte')
	" set the display encoding
	" (default is '', or 'utf-8' in the GUI)
	if &termencoding == ''
		" we're probably not using the GUI
		" note: :set won't allow &-replacement
		let &termencoding = &encoding
	endif
	" set the internal encoding
	set encoding=utf-8

	" &fileencoding (controls how characters in the internal encoding will
	" be written to the file) will be set according to &fileencodings
	" (default: 'ucs-bom', 'ucs-bom,utf-8,default,latin1' when &encoding
	"  is set to a Unicode value)
endif " has('multi_byte')

" supplemental spell file
"set spellfile=~/.vim/spell/en.ascii.add
"let &spellfile = "~/.vim/spell/".&spelllang.".".&encoding.".add"

" ensure every file opened from the command line gets opened in its own tab
" (except when running vimdiff)
if ! &diff
	tab all
endif

" formatting options
"" bad options
" a	Automatic formatting of paragraphs.  Every time text is inserted or
"	deleted the paragraph will be reformatted.  See auto-format.
"	When the 'c' flag is present this only happens for recognized
"	comments.
" n	When formatting text, recognize numbered lists.  This actually uses
"	the 'formatlistpat' option, thus any kind of list can be used.  The
"	indent of the text after the number is used for the next line.  The
"	default is to find a number, optionally followed by '.', ':', ')',
"	']' or '}'.  Note that 'autoindent' must be set too.  Doesn't work
"	well together with "2".
"	Example: >
"		1. the first item
"		   wraps
"		2. the second item
" o	Automatically insert the current comment leader after hitting 'o' or
"	'O' in Normal mode.
" t	Automatic formatting of text using textwidth (but not comments)
" w	Trailing white space indicates a paragraph continues in the next line.
"	A line that ends in a non-white character ends a paragraph.
set formatoptions-=anotw

"" good options
" c	Auto-wrap comments using textwidth, inserting the current comment
"	leader automatically.
" r	Automatically insert the current comment leader after hitting <Enter>
"	in Insert mode.
" q	Allow formatting of comments with "gq" (here, mapped to "Q").
"	Note that formatting will not change blank lines or lines containing
"	only the comment leader.  A new paragraph starts after such a line,
"	or when the comment leader changes.
set formatoptions+=crq

" taken from vim-sensible (https://github.com/tpope/vim-sensible)
if v:version > 703 || v:version == 703 && has("patch541")
	set formatoptions+=j " Delete comment character when joining commented lines
endif

" modify `formatlistpat' to include `*'-ed lists
"set formatlistpat=^\\s*\\d\\+\[\\]:.)}\\t\ ]\\s*			" default
"set formatlistpat=^\\s*\\(\\d\\+\\\|\\*\\\|-\\)[]:.)}\\t\ ]\\s*	" almost works
"set formatlistpat=^\\s*\\(\\d\\+[\\]:.)}\\t\ ]\\\|\\(\\*\\\|-\\)\\s\\)\\s*
set formatlistpat=^\\s*[\\d*]\\+\[\\]:.)}\\t\ ]\\s*

"" keys
" don't use Ex mode; use Q for formatting (default)
"map Q gq

" force opening new tabs when gf-ing
nnoremap gf <C-W>gf

" hitting ; in normal mode starts a command
nnoremap ; :

"" GUI clipboard operations
" Shift-Insert => paste
noremap <S-Insert> "+gP
" for insert mode
"map! <S-Insert> <C-R>+
" (these are better)
imap <S-Insert> <F10><C-R>+<F11>
cmap <S-Insert> <C-R>+

" Ctrl-Shift-Insert => paste after (insert mode N/A)
map <C-S-Insert> "+gp

" Ctrl-Insert => copy
"" line in command mode, selection in visual mode
nmap <C-Insert> "+yy
vmap <C-Insert> "+y

" Shift-Del => cut
"" line in command mode, selection in visual mode
nmap <S-Del> "+dd
vmap <S-Del> "+x

" paste mode
map <F10> :set paste<CR>
map <F11> :set nopaste<CR>
imap <F10> <C-O>:set paste<CR>
imap <F11> <nop>
set pastetoggle=<F11>

" C-u = undo in insert mode
inoremap <C-U> <C-G>u<C-U>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

function! VisualSelection(direction) range
	let l:saved_reg = @"
	execute "normal! vgvy"

	let l:pattern = escape(@", '\\/.*$^~[]')
	let l:pattern = substitute(l:pattern, "\n$", "", "")

	if a:direction == 'b'
		execute "normal ?" . l:pattern . "^M"
	elseif a:direction == 'gv'
		call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
	elseif a:direction == 'replace'
		call CmdLine("%s" . '/'. l:pattern . '/')
	elseif a:direction == 'f'
		execute "normal /" . l:pattern . "^M"
	endif

	let @/ = l:pattern
	let @" = l:saved_reg
endfunction

" folding
"" indent	: similarly-indented lines can fold
"" syntax	: syntax highlighting definitions specify folds
"" manual	: manually define folds (default)
""		: (fold paragraphs with `zfap')
set foldmethod=syntax
set foldlevelstart=1

" all folds open upon opening a file (close with `zc')
"set foldlevelstart=99

"" syntax-specific options (note: ~/.vim/ftplugin/* executes after these
"" options apply, so they must be defined here)

" perl
let perl_fold=1
"let perl_fold_blocks=1 " (screws up auto-indenting for some reason)
let perl_nofold_packages=1

"" perl extra coloring options
let perl_extended_vars=1
let perl_want_scope_in_variables=1
let perl_include_pod=1

" netrw
let g:netrw_http_cmd='curl -o'
let g:netrw_http_xcmd='--silent >'

" vim
""  0 or doesn't exist: no syntax-based folding
""  'a' : augroups
""  'f' : fold functions
""  'm' : fold mzscheme script
""  'p' : fold perl     script
""  'P' : fold python   script
""  'r' : fold ruby     script
""  't' : fold tcl      script
let g:vimsyn_folding = 'af'

" sh
"" g:is_sh	  : Borne shell (default)
"" g:is_kornshell : ksh
"" g:is_posix	  : same as ksh
"" g:is_bash	  : bash
let g:is_bash = 1

"" g:sh_fold_enabled - enable folding in sh files
"" possible values:
""   0 : no syntax folding (default)
""   1 : enable function folding
""   2 : enable heredoc folding
""   4 : enable if/do/for folding
""   3 : enables function and heredoc folding
let g:sh_fold_enabled = 3

" tohtml
"let g:html_use_encoding = 'utf-8'
let g:html_ignore_folding = 1
let g:html_use_css = 0

" php
"let g:php_folding = 1

" IDE plugin
let g:IDE_SyntaxScript		= "~/.vim/plugin/ideSyntax.pl"
" default "fMOSTw"
" "s" => disable warnings about being unable to generate syntax files (wtf)
let g:IDE_AdvancedFlags		= "fMOsTw"

" activate NERDTree when pressing the minus key
nmap <silent> - :NERDTreeToggle<CR>

" ignore common RCS directories
let NERDTreeIgnore=['^CVS$', '\~$']
