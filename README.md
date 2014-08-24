# chef入門

## URL

* http://dotinstall.com/lessons/basic_chef
* http://www.getchef.com/chef/

## 用語

* workstation
* cookbook
* knife
* node

## workstation(Mac) (#3)

* chef
* knife-solo

### install

```
curl -L https://www.opscode.com/chef/install.sh |sudo bash
sudo gem install knife-solo
knife configure
```

## Nodeの準備(#4)

```
vagrant init centos
vagrant up
vagrant ssh-config harmony >> ~/.ssh/config
ssh harmony
exit
```

## Chefのリポジトリ作成(#5)

### 使うもの

* site-cookbooks
* nodes

### Nodeをchef対応にする

```
knife solo init chef-repo
cd chef-repo
knife solo prepare harmony --bootstrap-version 11.12.0
```

* 参考
* http://mrk1869.com/blog/chef_prepare/

##  はじめてのcookbook

```
knife cookbook create hello -o site-cookbooks
```

### cookbookを作成する

1. `site-cookbooks/hello/recipes/default.rb`を変更する
2. `nodes/harmony.json`を変更する

### cookbookを反映させる

```
knife solo cook harmony
```

## packageでvim install

```
package "vim-enhanced" do
  action :install
end
```
でインストールされた。
これをリソースと呼ぶらしい。

### リソースの種類

* http://docs.getchef.com/chef/resources.html
* apt-getやyumの違いはchefが吸収してくれている。

## iptableをstopさせる

```
service "iptables" do
  action [:stop, :disable]
end
```

## 複数のpackageを導入する

## templateを利用する

erbはrubyの代表的なテンプレートエンジンの拡張子

## templateで変数を使ってみよう

harmony.jsonに書いた変数を利用することができる。
`ohai`コマンドで実行時の変数を出力できる


## webサーバの設定を変える
