set nocompatible                " viとの互換性なし
filetype plugin indent on       " 近代的なプラグインのためには必須
syntax on                       " シンタックスハイライト有効
set autoindent                  " 前の行のインデントを保存
set autoread                    " ディスクから再読み込み
set backspace=indent,eol,start  " 近代的なバックスペースの振る舞い
set belloff=all                 " ベルを無効化
set cscopeverbose               " cscopeの出力冗長化
set complete-=i                 " 現在のファイルとインクルードされるファイルから補完しない
set display=lastline            "
set encoding=utf-8              " デフォルトのエンコーディング
set formatoptions=tcqj          " 直近的なオートフォーマット
set fsync                       " fsyncを使ったファイル保存
set history=10000               " コマンド履歴
set hlsearch                    " 検索結果ハイライト
set incsearch                   " インクリメンタルサーチ
set langnoremap                 " マッピングが壊れるのを防ぐ
set laststatus=2                " 常にステータスラインを表示
set listchars=tab:>\ ,trail:-,nbsp:+  " chars for :list
set nrformats=bin,hex           " <c-a> and <c-x> support
set ruler                       " 現在行表示
set sessionoptions-=options     " セッションごとにオプションを持ち越さない
set shortmess=F                 " 簡潔なファイル情報
set showcmd                     " 最後に実行されたコマンド表示
set sidescroll=1                " スムーズな横スクロール
set smarttab                    " Tabキーを押したときの挙動設定
set tabpagemax=50               " -p フラグで開かれるタグの上限
set tags=./tags;,tags           " タグコマンドが探すファイル名
set ttimeoutlen=50              " キーシークエンスで次のキーを待つ秒数
set ttyfast                     " 接続を高速
set viminfo+=!                  " セッションにグローバル変数を保存
set wildmenu                    " コマンドライン補完
set wildmode=list:longest,full  " 最長マッチまで補完してから自動補完メニューを開く

set showmode                    " 現在のモードをわかるようにする
set spelllang+=cjk              " 日本語以外のスペルチェック
set spell                       " スペルチェック
set list                        " 文末の空白やタブを可視化
set nowrap                      " 折り返し無効
set title                       " タイトル表示
set number                      " 行番号表示
set expandtab                   " タブではなく半角スペース挿入
set tabstop=2                   " タブ文字数
set shiftwidth=2                " インデント数
set fileencodings=utf-8         " ファイルエンコーディング
set foldmethod=indent           " インデント単位で折り畳む
autocmd BufRead * normal zR

colorscheme slate

set directory=$HOME/.vim/swap

set clipboard=unnamed,unnamedplus

"undofile設定"
set undofile
if !isdirectory(expand("$HOME/.vim/undodir"))
  call mkdir(expand("$HOME/.vim/undodir"), "p")
endif
set undodir=$HOME/.vim/undodir

"mkdir -p ~/.vim/pack/plugins/start
packloadall "すべてのプラグインをロードする"
silent! helptags ALL "すべてのプラグイン用にヘルプファイルをロードする"


" ls -laのように表示
let g:netrw_liststyle=1
" 日付フォーマットを yyyy/mm/dd(曜日) hh:mm:ss
let g:netrw_timefmt="%Y/%m/%d(%a) %H:%M:%S"
" ヘッダ非表示
let g:netrw_banner=0
" プレビューウィンドウを垂直分割で表示
let g:netrw_preview=1
" 分割で開いたときに20%のサイズで開く
let g:netrw_winsize=20
" 表示形式をTreeViewに変更
let g:netrw_liststyle=3
" Enterで、タブ表示
let g:netrw_browse_split=3
