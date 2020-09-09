# bat

 強いcatコマンド

**Manual**

[sharkdp/bat: A cat(1) clone with wings.](https://github.com/sharkdp/bat)

[bat command man page](https://www.mankier.com/1/bat)

**Feature**

- シンタックスハイライト
- Gitの統合
- non-printing character（スペース、改行など）の表示
- 自走ページング（画面に収まらない場合は自動でPAGER起動）

<br>

## Usage

```shell
$ bat [Options] [FILE]...
```

FILEの指定がない場合は、標準入力から読み取る



### Options

#### -A, --show-all

​	スペース、改行を表示する

#### -p, --plain

​	簡易表示。ヘッダーや行数表示なし

#### -l, --language \<language>

​	言語指定ができる	

#### -H, --highlight-line \<N:M>

​	ハイライトする行を指定する
​	`:100` 先頭行から100行目まで。 `100:` 100行目から末尾まで

#### --wrap \<auto|never|character>

​	折り返すかどうか指定

#### -r, --line-range \<N:M>

​	表示する行を指定

<br>

## Custom

### シンタックスハイライト

`bat --list-themes` でハイライトテーマを取得できる。 設定はオプションか環境変数

**オプション**

```shell
bat --theme="Solarized (dark)" README.md
```

**環境変数**

```shell
export BAT_THEME="Solarized (dark)"
```

<br>

### 出力のスタイル

`-style`オプションで、出力スタイルをカスタマイズできる
複数指定する場合はカンマ区切り。 環境変数 `BAT_STYLE` でも指定可

```shell
export BAT_STYLE=numbers,changes
```

<br>

### テーマの追加

[batpigandme/night-owlish: 🌙🦉 ](https://github.com/batpigandme/night-owlish)

```shell
$ mkdir -p "$(bat --config-dir)/themes"
$ cd "$(bat --config-dir)/themes"

$ curl https://raw.githubusercontent.com/batpigandme/night-owlish/master/tmTheme/night-owlish.tmTheme > night-owlish.tmTheme

$ bat cache --build
```

**デフォの設定に戻したいとき**

```shell
$ bat cache --clear
```

<br>

### manの出力をbat仕様に

```shell
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
```

<br>

## Setting path

設定ファイルのパスは `bat --config-file` で調べることができる

明示的に指定したいときは↓

```shell
export BAT_CONFIG_PATH="/path/to/bat.conf"
```

