require 'distribution'
require_relative 'base'

module OptionCalculations
  # calculates various metrics associated with call options
  class Call < Base
    def price
      (delta * underlying_stock_price) -
        (Distribution::Normal.cdf(d2) * option_strike_price * e**(-risk_free_rate_of_return * years_until_maturity))
    end

    def delta
      Distribution::Normal.cdf(d1)
    end
  end
end
