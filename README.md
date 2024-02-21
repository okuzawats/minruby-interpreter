[![test](https://github.com/okuzawats/ruby-interpreter-by-ruby/actions/workflows/test.yml/badge.svg)](https://github.com/okuzawats/ruby-interpreter-by-ruby/actions/workflows/test.yml)
[![reviewdog](https://github.com/okuzawats/ruby-interpreter-by-ruby/actions/workflows/reviewdog.yml/badge.svg)](https://github.com/okuzawats/ruby-interpreter-by-ruby/actions/workflows/reviewdog.yml)
[![codecov](https://codecov.io/gh/okuzawats/ruby-interpreter-by-ruby/branch/main/graph/badge.svg?token=PGE2C50T14)](https://codecov.io/gh/okuzawats/ruby-interpreter-by-ruby)

# Ruby interpreter by Ruby

[RubyでつくるRuby ゼロから学びなおすプログラミング言語入門 – 技術書出版と販売のラムダノート](https://www.lambdanote.com/products/ruby-ruby)の内容を実装したプロジェクトです。 `main.rb` を実行すると、インタープリタがRubyで書かれたFizzBuzzのコードを解釈して、実行します。

```console
$ bundle exec ruby main.rb
```

RubyのコードからASTを構築するために、上記書籍用の補助ライブラリである `minruby` を用いています。

* [mame/minruby: 『Ruby で学ぶ Ruby』用補助ライブラリ](https://github.com/mame/minruby)

## 環境構築

### Ruby

```console
$ rbenv -v
rbenv 1.2.0
$ rbenv install 3.0.6
$ rbenv local 3.0.6
```

### Gem

```
$ bundler -v
Bundler version 2.2.33
$ bundle install
```

## 実行

### メイン

```console
$ bundle exec ruby main.rb
```

### ユニットテスト

```console
$ bundle exec ruby ./test/test_interpreter.rb
```

## その他

* GitHub ActionsによるCIでMiniTestとRuboCopが回っています。
* Codecovによってカバレッジが算出されています。
