# step2
## Herokuデプロイ方法
1. Herokuへログインする [heroku login]
2. 新規にアプリケーションを作成する [heroku create]
3. Herokuにpushする [git push heroku master]
4. Heroku上でマイグレーションする [heroku run rails db:migrate]
5. アプリを開き起動を確認する [heroku open]

## gem list
actioncable (5.2.8.1, 5.2.5)
actionmailer (5.2.8.1, 5.2.5)
actionpack (5.2.8.1, 5.2.5)
actionview (5.2.8.1, 5.2.5)
activejob (5.2.8.1, 5.2.5)
activemodel (5.2.8.1, 5.2.5)
activerecord (5.2.8.1, 5.2.5)
activestorage (5.2.8.1, 5.2.5)
activesupport (5.2.8.1, 5.2.5)
addressable (2.8.0)
archive-zip (0.12.0)
arel (9.0.0)
bigdecimal (default: 1.4.1)
bindex (0.8.1)
bootsnap (1.12.0)
builder (3.2.4)
bundler (2.3.18, default: 1.17.2)
byebug (11.1.3)
capybara (3.36.0)
childprocess (4.1.0)
chromedriver-helper (2.1.1)
cmath (default: 1.0.0)
coderay (1.1.3)
coffee-rails (4.2.2)
coffee-script (2.4.1)
coffee-script-source (1.12.2)
concurrent-ruby (1.1.10)
crass (1.0.6)
csv (default: 3.0.9)
date (default: 2.0.0)
dbm (default: 1.0.0)
did_you_mean (1.3.0)
diff-lcs (1.5.0)
e2mmap (default: 0.1.0)
erubi (1.10.0)
etc (default: 1.0.1)
execjs (2.8.1)
factory_bot (6.2.1)
factory_bot_rails (6.2.0)
fcntl (default: 1.0.0)
ffi (1.15.5)
fiddle (default: 1.0.0)
fileutils (default: 1.1.0)
forwardable (default: 1.2.0)
globalid (1.0.0)
i18n (1.12.0)
io-console (default: 0.4.7)
io-like (0.3.1)
ipaddr (default: 1.2.2)
irb (default: 1.0.0)
jbuilder (2.11.5)
json (default: 2.1.0)
listen (3.1.5)
logger (default: 1.3.0)
loofah (2.18.0)
mail (2.7.1)
marcel (1.0.2)
matrix (0.4.2, default: 0.1.0)
method_source (1.0.0)
mini_mime (1.1.2)
mini_portile2 (2.8.0)
minitest (5.16.2, 5.11.3)
msgpack (1.5.3)
mutex_m (default: 0.1.0)
net-telnet (0.2.0)
nio4r (2.5.8)
nokogiri (1.13.7)
openssl (default: 2.1.2)
ostruct (default: 0.1.0)
pg (1.4.1)
power_assert (1.1.3)
prime (default: 0.1.0)
pry (0.14.1)
pry-rails (0.3.9)
psych (default: 3.1.0)
public_suffix (4.0.7)
puma (3.12.6)
racc (1.6.0)
rack (2.2.4)
rack-test (2.0.2)
rails (5.2.8.1, 5.2.5)
rails-dom-testing (2.0.3)
rails-html-sanitizer (1.4.3)
railties (5.2.8.1, 5.2.5)
rake (13.0.6, 12.3.2)
rb-fsevent (0.11.1)
rb-inotify (0.10.1)
rdoc (default: 6.1.2)
regexp_parser (2.5.0)
rexml (3.2.5, default: 3.1.9)
rspec-core (3.11.0, 3.9.3)
rspec-expectations (3.11.0, 3.9.4)
rspec-mocks (3.11.1, 3.9.1)
rspec-rails (3.9.1)
rspec-support (3.11.0, 3.9.4)
rss (default: 0.2.7)
ruby_dep (1.5.0)
rubyzip (2.3.2)
sass (3.7.4)
sass-listen (4.0.0)
sass-rails (5.1.0)
scanf (default: 1.0.0)
sdbm (default: 1.0.0)
selenium-webdriver (4.1.0)
shell (default: 0.7)
spring (2.1.1)
spring-watcher-listen (2.0.1)
sprockets (4.1.1, 3.7.2)
sprockets-rails (3.4.2)
sqlite3 (1.4.4)
stringio (default: 0.0.2)
strscan (default: 1.0.0)
sync (default: 0.5.0)
test-unit (3.2.9)
thor (1.2.1)
thread_safe (0.3.6)
thwait (default: 0.1.0)
tilt (2.0.10)
tracer (default: 0.1.0)
turbolinks (5.2.1)
turbolinks-source (5.2.0)
tzinfo (1.2.9)
uglifier (4.2.0)
web-console (3.7.0)
webdrivers (5.0.0)
webrick (default: 1.4.2)
websocket-driver (0.7.5)
websocket-extensions (0.1.5)
xmlrpc (0.3.0)
xpath (3.2.0)
zlib (default: 1.0.0)



# Table Structure

## Model_name: User
| column_name | Data_type |
| :---: | :---: |
| email | string |
| password_digest | string |
| permition | boolean |

## Model_name: Task
| column_name | Data_type |
| :---: | :---: |
| name | string |
| content | string |
| deadline | date |
| priority | integer |
| status | string |

## Model_name: Label_master
| column_name | Data_type |
| :---: | :---: |
| name | string |

## Model_name: Label_child
| column_name | Data_type |
| :---: | :---: |
| Label_master_id | integer |
| Task_id | integer |
