# sinatra-skelton

my sinatra application skelton repos

## Requirements

* [bundler](http://bundler.io/)

## Usage

```
bundle install --path vendor/bundle --binstubs
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
