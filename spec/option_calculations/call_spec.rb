require 'option_calculations'

RSpec.describe OptionCalculations::Call do
  context 'when a call option with all properties is initialized' do
    let(:call_option) do
      described_class.new(
        underlying_stock_price: 100,
        option_strike_price: 125,
        risk_free_rate_of_return: 0.03,
        underlying_standard_deviation: 0.2,
        years_until_maturity: 3
      )
    end

    it 'returns the provided value for "underlying_stock_price"' do
      expect(call_option.underlying_stock_price).to eq(100)
    end

    it 'returns the provided value for "option_strike_price"' do
      expect(call_option.option_strike_price).to eq(125)
    end

    it 'returns the provided value for "risk_free_rate_of_return"' do
      expect(call_option.risk_free_rate_of_return).to eq(0.03)
    end

    it 'returns the provided value for "underlying_standard_deviation"' do
      expect(call_option.underlying_standard_deviation).to eq(0.2)
    end

    it 'returns the provided value for "years_until_maturity"' do
      expect(call_option.years_until_maturity).to eq(3)
    end

    it "can calculate the call's '#price'" do
      expect(call_option.price).to eq(8.671598717749958)
    end

    it "can calculate the call's '#delta'" do
      expect(call_option.delta).to eq(0.4163861874197372)
    end
  end

  context 'when time_until_maturity is 0' do
    let(:time_until_maturity) { 0 }
    let(:call_option) do
      described_class.new(
        underlying_stock_price: 100,
        option_strike_price: strike_price,
        risk_free_rate_of_return: 0.03,
        underlying_standard_deviation: 0.2,
        years_until_maturity: time_until_maturity
      )
    end

    context 'when an in the money call is added' do
      let(:strike_price) { 75 }

      it 'returns the correct "#price"' do
        expect(call_option.price).to eq(25.0)
      end

      it 'returns the correct "#delta"' do
        expect(call_option.delta).to eq(1)
      end
    end

    context 'when an out of the money call is added' do
      let(:strike_price) { 125 }

      it 'returns the correct "#price"' do
        expect(call_option.price).to eq(0)
      end

      it 'returns the correct "#delta"' do
        expect(call_option.delta).to eq(0)
      end
    end
  end
end
