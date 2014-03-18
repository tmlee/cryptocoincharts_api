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

end