class Quote < ActiveRecord::Base
  default_scope :order => "date ASC"
  scope :symbols, select(:symbol).group(:symbol)
  
end
