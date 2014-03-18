module CryptocoinchartsApi
  module API

    def list_coins(options={})
      api_call "listCoins", options
    end

  end
end