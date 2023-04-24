require 'option_calculations'

RSpec.describe OptionCalculations::Put do
  context 'when a call option with all properties is initialized' do
    let(:put_option) do
      described_class.new(
        underlying_stock_price: 100,
        option_strike_price: 125,
        risk_free_rate_of_return: 0.03,
        underlying_standard_deviation: 0.2,
        years_until_maturity: 3
      )
    end

    it 'returns the provided value for "underlying_stock_price"' do
      expect(put_option.underlying_stock_price).to eq(100)
    end

    it 'returns the provided value for "option_strike_price"' do
      expect(put_option.option_strike_price).to eq(125)
    end

    it 'returns the provided value for "risk_free_rate_of_return"' do
      expect(put_option.risk_free_rate_of_return).to eq(0.03)
    end

    it 'returns the provided value for "underlying_standard_deviation"' do
      expect(put_option.underlying_standard_deviation).to eq(0.2)
    end

    it 'returns the provided value for "years_until_maturity"' do
      expect(put_option.years_until_maturity).to eq(3)
    end

    it "can calculate the call's '#price'" do
      expect(put_option.price).to eq(22.912996876653473)
    end

    it "can calculate the call's '#delta'" do
      expect(put_option.delta).to eq(-0.5836138125802628)
    end
  end

  context 'when time_until_maturity is 0' do
    let(:time_until_maturity) { 0 }
    let(:put_option) do
      described_class.new(
        underlying_stock_price: 100,
        option_strike_price: strike_price,
        risk_free_rate_of_return: 0.03,
        underlying_standard_deviation: 0.2,
        years_until_maturity: time_until_maturity
      )
    end

    context 'when an out of the money put is added' do
      let(:strike_price) { 75 }

      it 'returns the correct "#price"' do
        expect(put_option.price).to eq(0)
      end

      it 'returns the correct "#delta"' do
        expect(put_option.delta).to eq(0)
      end
    end

    context 'when an in the money put is added' do
      let(:strike_price) { 125 }

      it 'returns the correct "#price"' do
        expect(put_option.price).to eq(25)
      end

      it 'returns the correct "#delta"' do
        expect(put_option.delta).to eq(-1.0)
      end
    end
  end
end
