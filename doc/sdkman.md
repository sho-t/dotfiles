
# sdkman

Software Development Kit Manager

**Manual**

[Home - SDKMAN! the Software Development Kit Manager](https://sdkman.io/)

<br>

## install

sdkmanのinstall
```bash
$ curl -s "https://get.sdkman.io" | bash
$ source "$HOME/.sdkman/bin/sdkman-init.sh"
```

Beta channel

```shell
# ~/.sdkman/etc/config
sdkman_beta_channel=true

$ sdk selfupdate force
```



## Usage

### SDKのインストール( install )

##### Latest Stable 

```shell
$ sdk install java
```

##### Remove Version

```shell
$ sdk uninstall java 8u111
```



### 一覧表示 ( list )

##### 利用可能なSDKの一覧

```bash
$ sdk list
```

##### sdkのバージョン一覧を表示

```shell
 $ sdk list gradle
================================================================================
Available Gradle Versions
================================================================================
     6.2                 5.3                 4.0.2               2.3
     6.2-rc-3            5.2.1               4.0.1               2.2.1
     6.2-rc-2            5.2                 4.0                 2.2
     6.2-rc-1            5.1.1               3.5.1               2.1
     6.1.1               5.1                 3.5                 2.0
     6.1                 5.0                 3.4.1               1.12
....以下略
```



### 使用するバージョンを選択( use )

```bash
$ sdk use gradle 6.2
```



### 特定のバージョンをデフォルトに( default )

```shell
$ sdk default java 11.0.6.hs-adpt
```



### 現在のバージョンを表示（ current ）

Candidateのバージョン表示
```shell
$ sdk current java
Using java version 11.0.6.hs-adpt
```

All Candidate
```shell
$ sdk current
Using:
gradle: 6.2
java: 11.0.6.hs-adpt
maven: 3.6.3
```



### 環境コマンド ( env )

`.sdkmanrc`の作成

```shell
$ sdk env init
```

設定の反映

```shell
$ sdk env
```

cdしたときにSDKバージョンを自動的に切り替える

```shell
$ sdkman_auto_env=true
```



### アップグレードバージョンの確認 (upgrade)

```shell
$ sdk upgrade Java
```



### sdkman自身 アップデート ( selfupdate )

```shell
$ sdk selfupdate
```

### sdkの絶対パスを取得 ( home )

```shell
$ sdk home java 8.0.252.hs-adpt
```

<br>

## 構成ファイル

`~/.sdkman/etc/config`

```
# make sdkman non-interactive, preferred for CI environments
sdkman_auto_answer=true|false

# perform automatic selfupdates
sdkman_auto_selfupdate=true|false

# disables SSL certificate verification
# https://github.com/sdkman/sdkman-cli/issues/327
# HERE BE DRAGONS....
sdkman_insecure_ssl=true|false

# configure curl timeouts
sdkman_curl_connect_timeout=5
sdkman_curl_continue=true
sdkman_curl_max_time=10

# subscribe to the beta channel
sdkman_beta_channel=true

# enable verbose debugging
sdkman_debug_mode=true|false

# enable colour mode
sdkman_colour_enable=true|false

# enable automatic env
sdkman_auto_env=true|false
```
