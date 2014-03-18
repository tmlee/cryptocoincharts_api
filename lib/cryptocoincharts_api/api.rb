module CryptocoinchartsApi
  module API

    def list_coins(options={})
      api_call "listCoins", options
    end

    def trading_pair(options={})
      currency_1 = options.delete(:currency_1)
      currency_2 = options.delete(:currency_2)
      api_call "tradingPair/#{currency_1}_#{currency_2}", options
    end

    def trading_pairs(pairs)
      api_call "tradingPairs", pairs, :post
    end

  end
end