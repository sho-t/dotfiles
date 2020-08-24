# Home-brew

パッケージ管理で、 Homebrew, brewbundle使ってるので基本な使い方書く。

[公式](https://github.com/Homebrew/homebrew-bundle)

[manual](https://docs.brew.sh/Manpage#bundle-subcommand)

## install

Dotfilesのインストール時にscript実行してる

```shell
  cd ~/dotfiles
  brew tap Homebrew/bundle
  brew bundle
```

`brew bundle` でBrewfileに記述のあるアプリを一括インストール

<br>

## brew bundle について

> Bundler for non-Ruby dependencies from Homebrew, Homebrew Cask, Mac App Store and Whalebrew.

##### 基本

```shell
brew bundle [install]
```

##### options

- `--global`： ホームディレクトリの `~/.Brewfile`を使用する

- `--file <path/filename>` ：対象のBrewfileを指定する

- `--no-lock` ： `Brewfile.lock.json`を出力しない

<br>

#### `$ brew bundle dump` :spiral_notepad:

現在のディレクトリに `Brewfile` を作成して、パッケージリストを出力

```shell
$ brew bundle dump --force --file ~/dotfiles/Brewfile
```

##### Options

- `--force`  ：既存の `Brewfile` を上書き
- `--global`： ホームディレクトリにリストファイル`.Brewfile`を作成
- `--describe 'comment'` ：コメント行にcommentを出力

<br>

#### `$ brew bundle cleanup`  :fire:

Brewfileにリストされてないアプリ・パッケージ一括削除

##### Options

  - `--force` ：リストせずにアンインストール
  - `--global`： ホームディレクトリのリストファイル`~/.Brewfile`を使用
  - `--file 'path/filename'` ：リストファイルを指定

<br>

#### `$ brew bundle check`  :cop:

Brewfile内で インストール・アップグレードが必要なものを表示

<br>

#### `$ brew budle list` :book:

Brewfileにリストされてるパッケージの依存関係を表示

##### Options

- `--brews` ： Formula
- `--cask` ：Homebrew Cask
- `--tap`： bew tap
- `--mas`： Mac App Store
- `--all`： 全部

