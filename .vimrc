" vi互換の動きにしない(これはもう必要ないらしいけど書いておく)
set nocompatible
" マルチバイト文字における幅調整考慮
" set ambiwidth=auto

" IME 系の動き
set imdisable " IMEを無効に
" kaoriya版のIME制御を入れる
set noimdisableactivate
au BufNewFile,BufRead * set iminsert=0

" neobundle 用
filetype off
"
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#rc(expand('~/.vim/bundle'))
endif
"
NeoBundleFetch 'Shougo/neobundle.vim'

" ここにインストールしたいプラグインのリストを書く
NeoBundle 'Shougo/vimproc'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'tacroe/unite-mark'
NeoBundle 'Shougo/unite-outline'
NeoBundle "Shougo/neocomplete.vim"
NeoBundle 'gcmt/wildfire.vim'

filetype plugin on
" filetype indent on

" 暗号化をblowfish暗号にする
set cryptmethod=blowfish
 
"左右のカーソル移動で行間移動可能にする。
set whichwrap=b,s,<,>,[,]
nnoremap h <Left>
nnoremap l <Right>
 
" ビジュアルモードでのヤンク後にカーソルを選択前の位置に戻さない
vnoremap y y`>
 
" 検索を循環させない
set nowrapscan
 
" バックアップファイルを作成しない
set nobackup
" undo 用の記録ファイルを作らない
set noundofile
" スワップファイルを作成しない
set noswapfile


" 対応括弧の強調しない
set matchtime=0


" 行番号表示
set number


" 見た目で行移動
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
 
" 削除でレジスタに格納しない(ビジュアルモードでの選択後は格納する)
nnoremap x "_x
nnoremap dd "_dd
 
" 水平タブ系の設定==============================================
" デフォルト設定
" タブとか改行を表示する
set list
" タブとか改行を示す文字列 eol(改行)は背景色違いのスペースにする。
set listchars=tab:>-,extends:<,trail:-,eol:\  
"タブを空白で入力する
set expandtab
"標準タブは4
set tabstop=4
set softtabstop=4
set shiftwidth=4
"自動的に前行と同じインデント挿入する
set autoindent
" インデントは全部手作業で整形スル派
set nosmartindent
set nocindent

" visualモードでインデントをいじったあとに解除しない
vnoremap > >gv
vnoremap < <gv
 
" 空行のインデントを勝手に消さない
nnoremap o oX<C-h>
nnoremap O OX<C-h>
inoremap <CR> <CR>X<C-h>
 
" 文字コード関連
" 文字コードの自動解釈の優先順位
set fileencodings=utf-8,cp932,euc-jp
" 改行コードの解釈優先順位
set fileformats=unix,dos
 
" 内部の解釈の文字コード　設定ファイルもこのコードで書け
set encoding=utf-8
" 内部の改行コード
set fileformat=unix
 
" ヤンクをクリップボードへ送り込む
set clipboard& clipboard+=unnamed
 
" 編集中でもバッファを切り替えれるようにしておく
set hidden
 
"ステータスのところにファイル情報表示
set statusline=%<[%n]%F%=\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}\ %l,%c\ %P 
 
"ルーラーを表示
set ruler
set title
 
" 矩形選択で行末を超えてブロックを選択できるようにする
set virtualedit& virtualedit+=block
 
"esc連打でハイライトをオフ
nnoremap <silent> <ESC><ESC> :noh<CR>
" ノーマルモード中でもエンターキーで改行挿入でノーマルモードに戻る
" いろいろなプラグインで挙動に問題があるのでオフで運用中
" noremap <CR> i<CR><ESC>

" Quick Fix Window 関係 ====================
" q でウィンドウを閉じる
autocmd FileType qf nnoremap <buffer> q :ccl<CR>
autocmd QuickfixCmdPost vimgrep if len(getqflist()) != 0 | copen | endif

" plugin setting ===================================================
" EasyMotion
" EasyMotion を起動するキー後 j k w b とかで検索する
let g:EasyMotion_leader_key = '<Space><Space>'
let g:EasyMotion_keys = 'fjdkslaureiwoqpvncm'

" Unit
" バッファ一覧のショートカットを設定する
noremap <C-U><C-B> :ls<CR>:buf 
noremap <C-U><C-M> :Unite mark<CR>
noremap <C-U><C-O> :Unite outline<CR>
noremap <C-U><C-T> :Unite tab<CR>

" NeoComplete
" 使用可能にする
let g:neocomplete#enable_at_startup = 1
" 自動補完しない
let g:neocomplete#disable_auto_complete = 1
" 一番目を自動選択
let g:neocomplete#enable_auto_select = 1
" Ctrl+Space で 補完ON
inoremap <expr><C-Space> pumvisible() ? "\<down>" : neocomplete#start_manual_complete()

" Wildfire.vim
let g:wildfire_water_map = '<S-Enter>'
let g:wildfire_objects = ["iw", "i'", 'i"', "a'", 'a"', 'i)', 'a)', 'i]', 'a]', 'i}', 'a}','ip', 'it', 'i>', 'a>']
