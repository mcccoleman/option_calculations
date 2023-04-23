require 'distribution'

module OptionCalculations
  #   performs base calculations for both put and call options
  class Base
    attr_accessor :underlying_stock_price,
                  :option_strike_price,
                  :risk_free_rate_of_return,
                  :underlying_standard_deviation,
                  :years_until_maturity

    def initialize(attributes)
      @underlying_stock_price = attributes.fetch(:underlying_stock_price, 0)
      @option_strike_price = attributes.fetch(:option_strike_price, 0)
      @risk_free_rate_of_return = attributes.fetch(:risk_free_rate_of_return, 0)
      @underlying_standard_deviation = attributes.fetch(:underlying_standard_deviation, 0)
      @years_until_maturity = attributes.fetch(:years_until_maturity, 0)
    end

    private

    # rubocop:disable Metrics/MethodLength
    def d1
      (
        get_natural_log(underlying_stock_price / option_strike_price.to_f) +
                  (
                    (
                      risk_free_rate_of_return +
                        (
                          (underlying_standard_deviation**2) * 0.5
                        )
                    ) * years_until_maturity
                  )
      ) / (
        underlying_standard_deviation * Math.sqrt(years_until_maturity).to_f
      )
    end

    # rubocop:enable Metrics/MethodLength

    def d2
      d1 - underlying_standard_deviation * Math.sqrt(years_until_maturity)
    end

    def get_natural_log(value)
      Math.log(value, e)
    end

    def e
      Math.exp(1)
    end
  end
end
