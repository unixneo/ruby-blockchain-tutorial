# README

This is a quick test implementation using rails and sinatra of the excellent blockchain tutorial:

### Let's Build a Blockchain by @Haseeb-Qureshi

```bash
    https://github.com/Haseeb-Qureshi/lets-build-a-blockchain
```

### Note:  

This is "tutorial grade only", strictly educational in nature.


### Required Environmental Vars:

```bash
    export HASEEBCOIN_ROOT=/path/to/your/ruby-blockchain-tutorial   
    export RAILS_MAX_THREADS=10    
```

### Gems Installed from the Command Line:

```bash
    gem install sinatra
    gem install puma
    gem install sqlite3
```

### Gems Added to the Default Rails Gemfile:

```ruby
    gem "colorize"
    gem "faraday"
    gem "sinatra"
    gem "yaml"
    gem "openssl"
    gem "digest"
    gem "base64"
    gem 'thread_safe'
    gem 'pluck_to_hash'
```

### Install the core as follows:

```bash
    git clone https://github.com/unixneo/ruby-blockchain-tutorial.git
    cd ruby-blockchain-tutorial
    gem install sinatra    #if not already installed
    gem install puma       #if not already installed
    gem install sqlite3    #if not already installed
    bundle
    rails db:migrate
```

On macos, bundle as follows:

```bash
    bundle install --path vendor/bundle
```

### To quickly test sinatra:

```bash
    ruby "$HASEEBCOIN_ROOT/lib/assets/blockchain/testing/test_sinatra.rb"
```

If all goes well from your  install, you should see something like this:

```bash
my_host$ ruby "$HASEEBCOIN_ROOT/lib/assets/blockchain/testing/test_sinatra.rb"
== Sinatra (v2.2.0) has taken the stage on 4567 for development with backup from Puma
Puma starting in single mode...
* Puma version: 5.6.4 (ruby 3.0.3-p157) ("Birdie's Version")
*  Min threads: 0
*  Max threads: 5
*  Environment: development
*          PID: 13117
* Listening on http://127.0.0.1:4567
* Listening on http://[::1]:4567
Use Ctrl-C to stop
```

### Testing

After you are sure sinatra is up and running, you can test as follows:

Initialize your blockchain as follows:

```bash
    ruby "$HASEEBCOIN_ROOT/lib/assets/blockchain/haseebcoin.rb"
```

In a few new termainals instances, try:

```bash
    ruby "$HASEEBCOIN_ROOT/lib/assets/blockchain/haseebcoin.rb" 1111 # client on port 1111
    ruby "$HASEEBCOIN_ROOT/lib/assets/blockchain/haseebcoin.rb" 2222 1111 # client on port 2222
    ruby "$HASEEBCOIN_ROOT/lib/assets/blockchain/haseebcoin.rb" 3333 2222 # client on port 3333
    ruby "$HASEEBCOIN_ROOT/lib/assets/blockchain/haseebcoin.rb" 4444 1111 # client on port 4444
```

When those 4 test nodes are up and running (1111,2222,3333 & 4444), try this:

```bash
    ruby "$HASEEBCOIN_ROOT/lib/assets/blockchain/testing/test1.rb"
```

### Known Bugs

- Needs better error checking.   

### More to come .... 
