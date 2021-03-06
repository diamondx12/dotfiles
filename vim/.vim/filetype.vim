" Only do this part when compiled with support for autocommands.

" Listen very carefully--I'm only going to say this once
if exists("did_load_my_filetypes")
  finish
endif
let did_load_my_filetypes=1

" This keeps getting set wrong for some reason
"au BufNew			*	setl fo-=ot

" automatic saving and loading of fold views, buffers, etc.
aug views
	au!

	" * do not save/load views for empty files
	" * do not save views for diffs as this sets a whole bunch of options
	"   that make it hard to work with when it's opened as a non-diff
"	au BufWinLeave	*	if expand("%") != "" && ! &diff |
"				\ mkview |
"				\ endif
"	au BufWinEnter	*	if expand("%") != "" |
"				\ silent loadview |
"				\ endif

	" addendum: too bloated a solution; just save the line number as a jump
	" position in ~/.viminfo:
	au BufReadPost	*
				\ if line("'\"") > 0 && line("'\"") <= line("$") |
				\	exe "normal! g`\"" |
				\ endif

aug END " views

" slightly better fugitive + gitgutter integration
" (only makes life easier if g:gitgutter_realtime=0 and g:gitgutter_eager=0)
aug fugitive_gitgutter

	" leaving Fugitive staging buffer
	au BufLeave	index
				\ GitGutterAll

	" after Fugitive sends off a commit (probably unnecessary)
	au BufDelete	COMMIT_EDITMSG
				\ GitGutterAll

aug END " fugitive_gitgutter

" XXX : this is now handled via ~/.vim/ftdetect/*.vim
"aug filetypedetect
"	au!
"
"	" warning: detects vim help files as 'text'
"	" addendum: this is more trouble than it's worth
"	au BufNewFile,BufRead	*.txt
"				\ if &ft == "" |
"				\	setf text |
"				\ endif
"
"aug END " filetypedetect

aug keycommands
	au!

	" insert lorem ipsum text for all file types
	au BufNewFile,BufRead	*
				\ nnoremap <buffer> <silent> ,L :so ~/.vim/templates/keys/lorem_ipsum.vim<CR>

	" use backslash-pipe (or [num]-backslash-pipe) to quickly comment lines

	"" perl, sh, php and various config files use the # comment leader
	au FileType		perl,sh,make,php,python,conf,gitconfig,alsaconf,resolv,config,mplayerconf,screen,procmail,muttrc,sudoers,gtkrc,readline,sshconfig,cvsrc,coffee,yaml,squid,remind
				\ nnoremap <buffer> <silent> <leader>\| :s+^+#+\|nohls<CR> |
				\ vnoremap <buffer> <silent> <leader>\| :s+^+#+\|nohls<CR>

	"" sql uses the -- comment leader
	au FileType		sql
				\ nnoremap <buffer> <silent> <leader>\| :s+^+--+\|nohls<CR> |
				\ vnoremap <buffer> <silent> <leader>\| :s+^+--+\|nohls<CR>

	"" c, javascript and java use the // comment leader
	"" (technically, so does PHP, but I like to pretend I'm writing Perl)
	au FileType		c,javascript,java
				\ nnoremap <buffer> <silent> <leader>\| :s+^+//+\|nohls<CR> |
				\ vnoremap <buffer> <silent> <leader>\| :s+^+//+\|nohls<CR>

	"" vim uses the " comment leader
	au FileType		vim
				\ nnoremap <buffer> <silent> <leader>\| :s+^+"+\|nohls<CR> |
				\ vnoremap <buffer> <silent> <leader>\| :s+^+"+\|nohls<CR>

	"" Xdefaults use the ! comment leader
	au FileType		xdefaults
				\ nnoremap <buffer> <silent> <leader>\| :s+^+!+\|nohls<CR> |
				\ vnoremap <buffer> <silent> <leader>\| :s+^+!+\|nohls<CR>


	"" ini and [shudder] asm use the ; comment leader
	au FileType		dosini,asm
				\ nnoremap <buffer> <silent> <leader>\| :s+^+;+\|nohls<CR> |
				\ vnoremap <buffer> <silent> <leader>\| :s+^+;+\|nohls<CR>

	" web functions
	" ,h - insert HTML header in HTML files
	au FileType		html
				\ nnoremap <buffer> <silent> ,h :so ~/.vim/templates/keys/html5-h.vim<CR> |
				\ nnoremap <buffer> <silent> ,j :so ~/.vim/templates/keys/html5-j.vim<CR>

	" ,h - insert XML header in XML files (though it's already inserted
	"      upon BufNewFile)
	au FileType		xml
				\ nnoremap <buffer> <silent> ,h :so ~/.vim/templates/keys/xml-h.vim<CR>

	" Perl debugging functions
	" ,d - insert Data::Dumper call
	" ,g - insert Getopt::Std option processing
	au FileType		perl
				\ nnoremap <buffer> <silent> ,d :so ~/.vim/templates/keys/perl-d.vim<CR> |
				\ nnoremap <buffer> <silent> ,g :so ~/.vim/templates/keys/perl-g.vim<CR>

	" Shell functions
	" ,g - insert getopts processing block
	" ,t - insert call to mktemp(1)
	" ,T - insert shell-script cleanup code that uses trap
	au FileType		sh
				\ nnoremap <buffer> <silent> ,g :so ~/.vim/templates/keys/sh-getopts.vim<CR> |
				\ nnoremap <buffer> <silent> ,t :so ~/.vim/templates/keys/sh-mktemp.vim<CR> |
				\ nnoremap <buffer> <silent> ,T :so ~/.vim/templates/keys/sh-trap-cleanup.vim<CR> |
				\ nnoremap <buffer> <silent> ,Z :so ~/.vim/templates/keys/sh-help_message.vim<CR>

	" ,v - insertion of vim filetype specification
	au FileType		sh,perl,html,xml,c,cpp,conf,mplayerconf,vim
				\ nnoremap <buffer> <silent> ,v :so ~/.vim/templates/keys/hintline-filetype.vim<CR>

	" ,h - insert <?php header in php files
	" ,E - throw new Exception
	" ,c - insert filename (without .php), useful for class files
	au FileType		php
				\ nnoremap <buffer> <silent> ,h :so ~/.vim/templates/keys/php-h.vim<CR> |
				\ nnoremap <buffer> <silent> ,E :so ~/.vim/templates/keys/php-E.vim<CR> |
				\ nnoremap <buffer> <silent> ,c :so ~/.vim/templates/keys/php-c.vim<CR> |
				\ nnoremap <buffer> <silent> ,D :so ~/.vim/templates/keys/php-D.vim<CR> |
				\ nnoremap <buffer> <silent> ,i :so ~/.vim/templates/keys/php-i.vim<CR> |
				\ nnoremap <buffer> <silent> ,l :so ~/.vim/templates/keys/php-l.vim<CR> |
				\ nnoremap <buffer> <silent> ,<C-d> :so ~/.vim/templates/keys/php-c-D.vim<CR> |
				\ nmap <buffer> <silent> Q ysil'A,<Esc>

	" build script build files
	" ,h - insert header file from /tmp/svn/_configure/__header
	" ,s - insert command for writing slack-desc
	" ,f - insert finisher file from /tmp/svn/_configure/__finisher
	au BufNewFile,BufRead	*/_configure/*-build,*/build/scripts/*-build
				\ nnoremap <buffer> <silent> ,h :so ~/.vim/templates/keys/_configure-h.vim<CR> |
				\ nnoremap <buffer> <silent> ,H :so ~/.vim/templates/keys/_configure-H.vim<CR> |
				\ nnoremap <buffer> <silent> ,s :so ~/.vim/templates/keys/_configure-s.vim<CR> |
				\ nnoremap <buffer> <silent> ,f :r /tmp/svn/_configure/__finisher<CR>
	au BufNewFile,BufRead	*/_configure/*,*/build/scripts/*
				\ nnoremap <buffer> <silent> ,p :so ~/.vim/templates/keys/_configure-p.vim<CR> |
				\ nnoremap <buffer> <silent> ,l :so ~/.vim/templates/keys/_configure-l.vim<CR> |
				\ nnoremap <buffer> <silent> ,d :so ~/.vim/templates/keys/_configure-d.vim<CR>

aug END " keycommands

" Transparent editing of gpg encrypted files.
" Placed Public Domain by Wouter Hanegraaff <wouter@blub.net>
aug encrypted
	au!

	" First make sure nothing is written to ~/.viminfo while editing
	" an encrypted file. We also don't want a swap file, as it writes
	" unencrypted data to disk.
	au BufReadPre,FileReadPre	*.gpg,*.asc
				\ setl vi= noswf

	" Switch to binary mode to read the encrypted file.
	au BufReadPre,FileReadPre,BufWritePre,FileWritePre	*.gpg
				\ setl bin

	" Decrypt the encrypted data in the buffer.
	au BufReadPost,FileReadPost	*.gpg,*.asc
				\ '[,']!sh -c 'gpg --decrypt 2>/dev/null'

	" Switch to normal mode for editing.
	au BufReadPost,FileReadPost,BufWritePost,FileWritePost	*.gpg
				\ setl nobin

	" Re-perform autocmds as if were editing the unencrypted file.
	au BufReadPost,FileReadPost	*.gpg,*.asc
				\ exe ':doau BufReadPost '.expand('%:rp')

	" Convert all text to encrypted text before writing.
	au BufWritePre,FileWritePre	*.gpg
				\ '[,']!gpg --default-recipient-self -e 2>/dev/null
	au BufWritePre,FileWritePre	*.asc
				\ '[,']!gpg --default-recipient-self -ae 2>/dev/null

	" Undo the encryption so we are back in the normal text, directly
	" after the file has been written.
	au BufWritePost,FileWritePost	*.gpg,*.asc
				\ u
aug END " encrypted

" Automatic header insertion for new source code files
aug sourcecode
	au!

	" perl
	au BufNewFile		*.pl
				\ so ~/.vim/templates/headers/perl.vim
	" perl modules
	au BufNewFile		*.pm
				\ so ~/.vim/templates/headers/perl-pm.vim

	" perl-CGI scripts
	au BufNewFile		*.cgi
				\ so ~/.vim/templates/headers/perl-cgi.vim

	" sh
	au BufNewFile		*.sh
				\ so ~/.vim/templates/headers/sh.vim

	" HTML
	au BufNewFile		*.html
				\ so ~/.vim/templates/headers/html5.vim

	" XML
	au BufNewFile		*.xml
				\ so ~/.vim/templates/headers/xml.vim

	"" XSLT
	au BufNewFile		*.xsl,*.xslt
				\ so ~/.vim/templates/headers/xsl.vim

	"" XSD
	au BufNewFile		*.xsd
				\ so ~/.vim/templates/headers/xsd.vim

	" scilab (not really applicable anymore)
	"au BufNewFile		*.sci
	"			\ exe 'norm afunction '.expand('%:t:r').'()\nendfunction\<esc>O// FIXME: description stub\n\n// Arguments:\n//\tFIXME: arguments stub\n//\n// Returns FIXME: return stub\n//!\n\<esc>'

aug END " sourcecode

" Use vim as a hex editor
" (this gets really annoying when trying to edit files with a .dat extension;
" should look into setting it up as a filetype)
"aug binary
"	au!
"
"	" Switch to binary mode to read the file
"	au BufReadPre,FileReadPre	*.dat
"				\ setl bin
"
"	" Perform a hex dump when opening OR refresh hex dump with new
"	" file contents after writing
"	au BufReadPost,FileReadPost,BufWritePost,FileWritePost	*.dat
"				\ '[,']!xxd
"
"	" Switch to normal mode for editing
"	au BufReadPost,FileReadPost	*.dat
"				\ setl ft=xxd nobin
"
"	" Revert hex dump to binary data before writing
"	au BufWritePre,FileWritePre	*.dat
"				\ '[,']!xxd -r
"
"aug END " binary

" append compressors/decompressors to file pre-processing
aug gzipext

	" 7zip (not working)
	"au BufReadPre,FileReadPre	*.7z
	"			\ setlocal bin
	"au BufReadPost,FileReadPost	*.7z
	"			\ call gzip#read("7za x -so --")
	"au BufWritePost,FileWritePost	*.7z
	"			\ call gzip#write("7za a -si --")
	"au FileAppendPre		*.7z
	"			\ call gzip#appre("7za x -so --")
	"au FileAppendPost		*.7z
	"			\ call gzip#write("7za a -si --")

	"" archive support
	"au BufReadCmd			*.tar.7z,*.t7z
	"			\ call tar#Browse(expand("<amatch>"))

	" other ZIP-based archives
	"" *.odt	: OpenDocument text
	"" *.odm	: OpenDocument text
	au BufReadCmd			*.k3b,*.odt,*.odm,*.epub,*.pk3
				\ call zip#Browse(expand("<amatch>"))

aug END " gzipext

" vi: ft=vim fdm=syntax
