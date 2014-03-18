require 'minitest_helper'
require 'cryptocoincharts_api'
require 'debugger'

class CryptocoinchartsApiTest < MiniTest::Unit::TestCase

  def setup
    @client = CryptocoinchartsApi::Client.new
  end

  def test_list_coins
    stub_get("http://www.cryptocoincharts.info/v2/api/listCoins", 'list_coins.json')
    result = @client.list_coins
    assert_equal result.first[:name], "FourtyTwoCoin"
    assert_equal result.first[:website], "http://fourtytwo42.com/"
    assert_equal result.size, 265
  end

  def test_trading_pair
    stub_get("http://www.cryptocoincharts.info/v2/api/tradingPair/drk_btc", 'trading_pair.json')
    result = @client.trading_pair currency_1: 'drk', currency_2: 'btc'
    assert_equal result[:id], "drk/btc"
    assert_equal result[:price], "0.00122751"
    assert_equal result[:best_market], "cryptsy"
  end

  def test_trading_pairs
    stub_post("http://www.cryptocoincharts.info/v2/api/tradingPairs", 'trading_pairs.json')
    result = @client.trading_pairs "ltc_btc,drk_btc,ppc_btc,doge_btc"
    assert_equal result.size, 10
  end

end