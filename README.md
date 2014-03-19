# CryptocoinchartsApi

Ruby wrapper for the Cryptocoincharts API (http://www.cryptocoincharts.info/).
You can get more information about the API at http://www.cryptocoincharts.info/v2/tools/api

## Installation

Add this line to your application's Gemfile:

    gem 'cryptocoincharts_api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cryptocoincharts_api

## Usage

### Available Methods

    list_coins
    trading_pair
    trading_pairs

### Initialize a Client

    client = CryptocoinchartsApi::Client.new

### List Coins
  
    client.list_coins

### Get a Trading Pair

    client.trading_pair currency_1: 'btc', currency_2: 'ltc'

### Get a List of Trading Pairs

    client.trading_pairs pairs: "ltc_btc,drk_btc,ppc_btc,doge_btc"


## Contributing

1. Fork it ( http://github.com/<my-github-username>/cryptocoincharts_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
