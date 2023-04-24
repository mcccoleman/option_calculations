require 'distribution'
require_relative 'base'

module OptionCalculations
  # calculates various metrics associated with put options
  class Put < Base
    def price
      (Distribution::Normal.cdf(-d2) * option_strike_price * e**(-risk_free_rate_of_return * years_until_maturity)) -
        (Distribution::Normal.cdf(-d1) * underlying_stock_price)
    end

    def delta
      -Distribution::Normal.cdf(-d1)
    end
  end
end
