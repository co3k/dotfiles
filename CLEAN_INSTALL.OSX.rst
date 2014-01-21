================
OSX 環境構築手順
================

1. OSX のインストール
=====================

基本的には画面の指示通りに進める。

* データは移行しない
* Apple ID は ``apple`` サフィックス付きのとあるメールアカウントを利用 (指定があれば変更)

本手順書の基となった環境では、セットアップ完了後に Marvericks へのアップグレードをおこなったが、新しく購入する MacBook Pro であれば最初のセットアップ時点で既に Marvericks かもしれない。

OS のセットアップ完了後、ソフトウェアアップデートをおこなう。

2. Homebrew 環境の構築
======================

デファクトは正義なので、僕は、 Homebrew ちゃん！！

2-1. Xcode のインストール
-------------------------

Homebrew のみが目的であれば Command Line Tools for Xcode で充分だが、 Xcode の提供する開発環境全体が必要なので、 https://itunes.apple.com/us/app/xcode/id497799835 を App Store 経由でインストールする。

2-2. XQuartz のインストール
---------------------------

コマンド経由で入れるの辛そうなのでここで入れる。 http://xquartz.macosforge.org/landing/ から入手する。

2-3. Homebrew のインストール
----------------------------

以下のコマンドを実行してインストールする::

    $ ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

インストール完了後、 ``brew doctor`` を実行して警告類の指示に従って追加作業をおこなう。

``brew doctor`` を実行して ``Your system is ready to brew`` が確認できたら次に進む。

2-4. Homebrew 経由で Git をインストールする
-------------------------------------------

以下のコマンドを実行してインストールする::

    $ brew install git

3. 設定
=======

以下のコマンドを実行して俺のドットファイル群を落としてくる::

    $ cd ~
    $ git clone git@github.com:ebihara/dotfiles.git

.gitconfig の基となるファイルを作成する::

    $ cd dotfiles
    $ cp _gitconfig.example _gitconfig
    $ vi _gitconfig

ドットファイルやパッケージ類のインストールをおこなう::

    $ ./install.sh

mutt でメールを閲覧するための設定をおこなう::

    $ cp ~/dotfiles/mutt-template ~/.mutt/work
    $ cp ~/dotfiles/mutt-template ~/.mutt/personal
    $ vi ~/.mutt/work ~/.mutt/personal

OSX やアプリケーション類の設定をおこなう::

    $ ./os-setup.sh

コマンドが完了したあとは一度マシンの再起動をおこなう (設定変更に影響するアプリの再起動だけでいいんだけれども面倒なので)。
