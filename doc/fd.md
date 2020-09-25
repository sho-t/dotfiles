# Fd

 強そうなfindコマンド

**Manual**

[sharkdp/fd: A simple, fast and user-friendly alternative to 'find'](https://github.com/sharkdp/fd)

[man page](https://www.mankier.com/1/fd)

**Features**

- 速い
- 使いやすい構文。 `find -iname '*PATTERN*'` :arrow_forward:  `fd PATTERN`
- 出力が色付き
- デフォルトで大文字小文字を区別しない
- デフォで隠しファイルを表示しない
- デフォで`.gitignoe`に記載がある ファイルを無視する

<br>

## Usage

**構文**

```shell
$ fd [FLAGS/OPTIONS] [<pattern>] [<path>...]
```

引数なしでカレントディレクトリ以下のファイルを列挙。 `ls -R`と同じ動きをする

<br>

### Flags :rainbow_flag:

#### ■ 隠しファイル(`-H`)と gitignoreファイル(`-I`)を無視しない

fdではデフォで無視するので表示したい場合はFlag指定する必要ある
` -H, --hidden` ：隠しファイル表示
`-I, --no-ignore`： ignoreファイル表示



#### ■ 大文字小文字区別する(`-s`)、区別しない(`-i`)
デフォでは**smart case** 検索（検索文字に大文字含まれなかったら区別しない)
`-s, --case-sensitive` ：区別する
`-i, --ignore-case`： 区別しない



#### ■ 正規表現の代わりにGlobベース検索を実行する (`-g, --glob`)

デフォルトでは 正規表現による検索 `--regex`
例：`fd -g "*.md"`



#### ■ 文字リテラルとして検索 (`-F` or `--fixed-strings`)



#### ■ 絶対パスで出力する  (`-a, --absolute-path`)



#### ■ ls -l 形式で出力 (`-l` or ` --list-details`)

`-x ls -l`のalias



#### ■ シンボリックリンクを辿って検索 (`-L ` or `--follow`)



#### ■ 検索パターンにパス名が使える (`-p` or `--full-path`)

デフォでは検索パターンに `/`パスセパレータが含まれるとエラーになる



#### ■ 出力結果を改行ではなく、null文字で区切る (`-0` or `--print0`)



#### ■ 出力結果の数を制限する (`--max-results <count>`)

`-1` は `--max-results 1`と同じ



#### ■ 権限エラーとか表示する  (`--show-errors`)

<br>

### Options :sushi:

#### ◆ 検索するディレクトリの深さを指定する   (`-d` or `--max-depth <num>`)

`--min-depth`もある



#### ◆ ファイルタイプを指定する(`-t` or `--type <filetype>`)

- `f`：通常ファイル
- `d`：ディレクトリ
- `l`：シンボリックリンク
- `x`：実行可能ファイル
- `e`： 空ファイル／ディレクトリ
- `s`：ソケット
- `p`：名前付きパイプ



#### ◆ 拡張子でフィルタリングする(`-e` or `--extension <ext>`)



#### ◆ 除外するパターンを指定する(`-E` or `--exclude <pattern>`)



#### ◆ ファイルサイズで結果を制限する(`-S` or `--size <size>`)
sizeの書式は → `<+-><NUM><UNIT>`


#### ◆ ユーザー、グループでフィルタリング(`-o` or `--owner [user][:group]`)



#### ◆ 検索結果に対してコマンドを実行(`-x`、`-X`)

` -x, --exec <command>` ：検索結果ごとにコマンド実行
`-X, --exec_bach <command>`： 全ての検索結果に対してコマンド実行

- `{}`：path
- `{/}`：basename
- `{//}`：親ディレクトリ
- `{.}`：拡張子抜きpath
- `{/.}`：拡張子抜きbasename

<br>

## パターン構文

Rustの正規表現とかが使われてる

[regex - Rust](https://docs.rs/regex/1.0.0/regex/#syntax)

[globset - Rust](https://docs.rs/globset/0.4.5/globset/#syntax)

<br>

## 設定ファイル

`$HOME/.config/fd/ignore`に除外パターンを記述できる


