# README

This is a quick test implementation using rails and sinatra of the excellent blockchain tutorial:

### Let's Build a Blockchain by @Haseeb-Qureshi

```
https://github.com/Haseeb-Qureshi/lets-build-a-blockchaim
```


Gems Installed from the Command Line:

```bash
gem install sinatra
gem install puma
```

Gems Added to the Default Rails Gemfile:

```ruby
gem "colorize"
gem "faraday"
gem "sinatra"
gem "yaml"
gem "openssl"
gem "digest"
gem "base64"
gem 'thread_safe'
```

Install the core as follows:

```bash
git clone https://github.com/unixneo/ruby-blockchain-tutorial.git
cd ruby-blockchain-tutorial
gem install sinatra
gem install puma
bundle
```

To quickly test sinatra:

```bash
cd ruby-blockchain-tutorial
cd lib/assets/blockchain/testing
ruby test_sinatra.rb
```

If all goes well from your  install, you should see something like this:

```bash
my_host$ ruby test_sinatra.rb
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

After you are sure sinatra is up and running, you can test as follows:

Initialize your blockchain as follows:

```bash
cd lib/assets/blockchain/
ruby haseebcoin.rb
```

In a few new termainals instances, try:

```bash
cd lib/assets/blockchain/
ruby haseebcoin.rb 1111  # client identified on port 1111
ruby haseebcoin.rb 2222 # client identified on port 2222
ruby haseebcoin.rb 3333  # client identified on port 3333
ruby haseebcoin.rb 4444  # client identified on port 4444
```

When those test nodes are up and running, the try this:

```bash
ruby lib/assets/blockchain/testing/test1.rb
```

### More to come .... 