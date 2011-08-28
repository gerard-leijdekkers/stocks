class HistoricalQuote
  attr_accessor :symbol, :from_date, :to_date, :interval, :quotes
  
  def initialize(symbol, from_date = 1.year.ago, to_date = Date.today, interval = :daily)
    self.symbol = symbol
    self.from_date = from_date
    self.to_date = to_date
    self.interval = self.interval
    self.quotes = []
  end
  
  def fetch
    YHistoricalQuote.new(symbol, from_date, to_date, interval).fetch.quotes.each do |y_quote|
      quote = Quote.new(symbol: symbol,
                        date:   y_quote.values[:date],
                        open:   y_quote.values[:open].to_f,
                        close:  y_quote.values[:close].to_f,
                        high:   y_quote.values[:high].to_f,
                        low:    y_quote.values[:low].to_f
              )
      self.quotes << quote
    end
    self
  end
end
