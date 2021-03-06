# frozen_string_literal: true

class Stock < ApplicationRecord
  def self.new_from_lookup(ticker_symbol)
    looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
    new(name: looked_up_stock.company_name, ticker: looked_up_stock.symbol, price: looked_up_stock.latest_price)
  rescue Exception => e
    nil
  end
end
