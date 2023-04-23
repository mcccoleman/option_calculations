# Summary

`option_calculations` is a module designed to aid with the pricing of put and call options contracts. Once all of the methods have been added it will be turned into a gem.

# Use

require 'option_calculations'

```
call = OptionCalculations::Call.new(underlying_stock_price: 324, option_strike_price: 124.50, risk_free_rate_of_return: 0.03, underlying_standard_deviation: 0.2, years_until_maturity: 3)

```

The following methods currently exist for call options:

- `price`
- `delta`

# To dos

- Error handling
- Add put option contracts
- Add additional Greek Calculations

# Additional reading

The Black-Scholes formula, which this gem is based upon, is a well-known formula that is used to price options contracts. As part of generating this gem, several publications were consulted:

- _Options, Future, and Other Derivatives_, Tenth Addition, by John C. Hull
- _Option Volatility & Pricing_, Second Edition, by Sheldon Natenberg

# Contributing

If interested in contributing, please email Michael Coleman at [colemanmc02@gmail.com](mailto:colemanmc02@gmail.com).

# Disclosure

Please note that the author of this module in no way guarantees the accuracy of the performed calculations.
