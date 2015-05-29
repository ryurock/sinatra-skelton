# sinatra-skelton

my sinatra application skelton repos

## Requirements

* [bundler](http://bundler.io/)
* [bower](http://bower.io/)
* mysql-devel

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
