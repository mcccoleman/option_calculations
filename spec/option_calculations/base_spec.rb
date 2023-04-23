require 'option_calculations'

RSpec.describe OptionCalculations::Base do
  context 'when a call option with all properties is initialized' do
    let(:base_option) do
      described_class.new(
        underlying_stock_price: 100,
        option_strike_price: 125,
        risk_free_rate_of_return: 0.03,
        underlying_standard_deviation: 0.2,
        years_until_maturity: 3
      )
    end

    it 'returns the provided value for "underlying_stock_price"' do
      expect(base_option.underlying_stock_price).to eq(100)
    end

    it 'returns the provided value for "option_strike_price"' do
      expect(base_option.option_strike_price).to eq(125)
    end

    it 'returns the provided value for "risk_free_rate_of_return"' do
      expect(base_option.risk_free_rate_of_return).to eq(0.03)
    end

    it 'returns the provided value for "underlying_standard_deviation"' do
      expect(base_option.underlying_standard_deviation).to eq(0.2)
    end

    it 'returns the provided value for "years_until_maturity"' do
      expect(base_option.years_until_maturity).to eq(3)
    end

    it 'calculates "#d1"' do
      expect(base_option.send(:d1)).to eq(-0.21114724520372083)
    end

    it 'calculates "#d2"' do
      expect(base_option.send(:d2)).to eq(-0.5575574067174963)
    end

    it 'calculates "#e"' do
      expect(base_option.send(:e)).to eq(2.718281828459045)
    end

    it 'calculates "#get_natural_log"' do
      expect(base_option.send(:get_natural_log, 2)).to eq(0.6931471805599453)
    end
  end
  context 'when an option with only some properties are set' do
    let(:base_option) do
      described_class.new(
        underlying_stock_price: 132
      )
    end

    it 'sets the provided property as what is provided' do
      expect(base_option.underlying_stock_price).to eq(132)
    end

    it 'sets "option_strike_price" to zero' do
      expect(base_option.option_strike_price).to eq(0)
    end

    it 'sets "risk_free_rate_of_return" to zero' do
      expect(base_option.risk_free_rate_of_return).to eq(0)
    end

    it 'sets "underlying_standard_deviation" to zero' do
      expect(base_option.underlying_standard_deviation).to eq(0)
    end

    it 'sets "years_until_maturity" to zero' do
      expect(base_option.years_until_maturity).to eq(0)
    end
  end
end
