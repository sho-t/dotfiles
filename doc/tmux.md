
# tmux 

tmux のキーバーインドとか

##### **manual**

[Home · tmux/tmux Wiki ](https://github.com/tmux/tmux/wiki)

[tmux(1) - OpenBSD manual :blue_book:](https://man.openbsd.org/tmux)

[tmux - ArchWiki](https://wiki.archlinux.jp/index.php/Tmux#.E3.82.B7.E3.82.A7.E3.83.AB.E3.81.AE.E3.83.AD.E3.82.B0.E3.82.A4.E3.83.B3.E6.99.82.E3.81.AB_tmux_.E3.82.92.E8.B5.B7.E5.8B.95)

**tmux てなに**

端末多重化ソフトウェア

<br>

## Commands :speech_balloon: & Bindkeys :keyboard:

prefix は `Ctrl + j` にしてる

Commandsの()内はalias。太字は独自の設定

### 1. session操作

**Bindkeys**

| Key        | Commands                                   | Description           |
| :--------- | :----------------------------------------- | --------------------- |
| -          | new-session (new) [-s  <session名>]        | 新しいSessionを作成   |
| -          | attach-session (attach) <-t sesssion-name> | attach                |
| prefix + d | detach-client                              | detach                |
| prefix + $ | rename-session (rename)                    | Session名を変更       |
| -          | kill-session [-t <Session名>]              | Sessionを閉じる       |
| -          | kill-server                                | 全てのSessionを閉じる |

<br>

### 2 window操作

##### Bindkeys


| Key            | Commands                     | Description                 |
| :------------- | :--------------------------- | --------------------------- |
| prefix + c     | new-window                   | 新しいWindowを作成          |
| prefix + n     | next-window                  | 次のWindowに移動            |
| prefix + p     | previous-window              | 前のWindowに移動            |
| prefix + 0-9   | select-window -t :=[0-9]     | 指定したindexのWindowの移動 |
| prefix + '     | select-window -t ':%%'       | 入力したindexのWindowの移動 |
| prefix + ,     | rename-window                | Windowの名前を変更          |
| prefix + f     | find-window -Z -- '%%'       | Windowも文字列検索          |
| **prefix + X** | confirm-before とkill-window | Windowを削除                |

<br>

### 3.pane操作

##### Bindkeys

| Key            | Commands                | Description                     |
| :------------- | :---------------------- | ------------------------------- |
| **prefix + /** | split-window -h         | Paneを縦に分割                  |
| **prefix + -** | split-window -v         | Paneを横に分割                  |
| **prefix + m** | split-window -h -- nvim | vimを新規Paneで開く             |
| **prefix + e** | synchronize-panes       | 入力同期モードのトグル          |
| prefix + hjkl  | select-pane -L[DUR]     | Paneの移動(上下左右)            |
| Prefix + HJKL  | resize-pane -L[DUR] 5   | Paneサイズを広く (繰り返し可能) |
| prefix + o     | rotate-window           | 別のPaneに移動                  |
| prefix + q     | display-panes           | Paneを選択して移動              |
| prefix + ;     | last-pane               | 直前に操作したPaneに移動        |
| prefix + {}    | swap-pane -UD           | Paneの入れ替え                  |
| prefix + z     | resize-pane -Z          | 現在のPaneの最大化              |
| prefix + !     | break-pane              | 現在のPaneをWindow化            |
| prefix + x     | kill-pane               | 現在のPaneを削除                |

<br>

### 4. Copy-mode :clipboard: [:link:](https://man.openbsd.org/tmux#WINDOWS_AND_PANES)

`setw -g mode-keys vi` してるからだいたい vimと一緒

`prefix + [` でコピーモード開始。pipeで pbcopyしてる

**Bindkey**

| Key   | Function                 |
| :---- | :----------------------- |
| v     | 選択開始                 |
| V     | 行選択                   |
| C-v   | 矩形選択モードに切り替え |
| y     | ヤンク                   |
| Enter | ヤンクして終了           |

<br>

### 5. Choose tree [:link:](https://man.openbsd.org/tmux#choose-tree)

treeとサムネイルを表示して選択できる

- Sessionの表示：`prefix` + `s` (choose-session -Zs)
- Windowの表示：`prefix` + `w` (choose-session -Zw)

**書式**

```
choose-tree [-GNrswZ] [-F format] [-f filter] [-O sort-order] [-t target-pane] [template]
```

**オプション**

- `-N`：Previewを表示しない
- `-r`：ソート逆順
- `-O`：ソート指定 [ *index / name / time* ]

**Bindkey**

| Key   | Function                                 |
| :---- | :--------------------------------------- |
| Enter | アイテムを選択                           |
| k     | 前のアイテムを選択                       |
| j     | 次のアイテムを選択                       |
| l     | 選択中のアイテムを展開                   |
| h     | 選択中のアイテムを折りたたむ             |
| <     | Previewを左にScroll                      |
| >     | Previewを右にスクロール                  |
| x     | 選択中のアイテムを削除                   |
| X     | タグ付きのアイテムを削除                 |
| C-s   | 名前で検索                               |
| n     | 検索を繰り返す                           |
| t     | 選択中のアイテムにタグを付ける/外す      |
| T     | 選択中のアイテムのタグを外す             |
| C-t   | すべてのアイテムにタグを付ける           |
| :     | タグがついたアイテムでコマンドを実行する |
| f     | フィルタリングする形式を入力             |
| O     | ソート指定の切替                         |
| v     | Previewの切替                            |
| q     | 閉じる                                   |

<br>

### 6. その他 

**Bindkey**

| key  | commands       | Description          |
| ---- | -------------- | -------------------- |
| ?    | list-keys -N   | コマンド一覧の表示   |
| :    | command-prompt | コマンドラインモード |
| t    | clock-mode     | 時計を表示           |

<br>

## Settings

**基本的にこれだけ**

`bind-key (bind)`、`unbind-key (unbind)` 、`set-option (set)`、`set-window-option (stew)`

<br>

**bindkey一覧**

```
$ tmux list-keys [-T <root|prefix|copy-mode-vi>
```

<br>

**オプションの表示**

```
# サーバーオプション
tmux show -s

# グローバルオプション
tmux show -g

# ウィンドうオプション
tmux show -gw
```

