" フォントをRictyに指定
if has('mac')
    set guifont=Ricty:h16
    set lsp=4
endif

" 色系の指定=======================================
" とりあえずscheme指定でザックリ指定
colorscheme evening
" set background=dark
" colorscheme solarized

" マルチバイト文字系のlistcharsで表示される設定はgvimrcに書かないと反映されない
set listchars=precedes:«,extends:»,eol:↲,tab:▸\ 

" 改行をあまり目立たないように
hi NonText guifg=#555555
hi NonText guibg=#333333
hi SpecialKey guifg=#555555
hi LineNr ctermbg=black guifg=#8F908A
au GUIEnter * winpos 0 0
set lines=160 columns=200

" ポップアップ補完メニュー色設定（通常の項目、選択されている項目、スクロールバー、スクロールバーのつまみ部分）
highlight Pmenu ctermbg=8 guibg=#606060
highlight PmenuSel ctermbg=12 guibg=SlateBlue
highlight PmenuSbar ctermbg=0 guibg=#404040
" 折りたたみの色をあまり濃くしない
highlight Folded guibg=#555555 guifg=#ccccff
highlight FoldColumn guibg=#ff0000 guifg=white

" ツールバー無しよ
set guioptions-=T
