# sinatra-skelton

my sinatra application skelton repos

## Requirements

* [bundler](http://bundler.io/)
* [bower](http://bower.io/)

## Quick Start

```
#setup first time
bundle install --path vendor/bundle --binstubs
bower install
rake db:create
rake db:migrate

# server started
rackup --host 0.0.0.0
```

## Create Database

use [sinatra-activerecord](https://github.com/janko-m/sinatra-activerecord)

```
rake db:create
```

## Migration

```
rake db:migrate
```


## Server Start

web server start

```
rackup --host 0.0.0.0
```

## Dev Tips

### Using to [pry-remote](https://github.com/Mon-Ouie/pry-remote)

#### install 

install [pry-remmote](https://github.com/Mon-Ouie/pry-remote)

```
gem install pry-reomote
```

#### write breakpoint

break point pry writting

```
binding.remote_pry
```

#### sinatra Rack server Start

```
rackup --host 0.0.0.0
```

#### other console type ``` pry-remote ```

open pry-remote window

### [active-record](https://github.com/rails/rails/tree/master/activerecord) Tips

#### validate 

* [RailsにおけるValidationの処理をまとめてみた](http://somethingpg.hatenablog.com/entry/2013/12/23/085210)

### i18n Tips

* [Railsの多言語化対応 I18nのやり方を整理してみた！【国際化/英語化】](http://morizyun.github.io/blog/i18n-english-rails-ruby-many-languages/)
