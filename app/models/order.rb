class Order < ApplicationRecord
  belongs_to :merchant
  belongs_to :shopper

  scope :completed, -> { where('created_at > ?', DateTime.new(1)) }
  scope :completed_between, ->(start_date, end_date) { where("completed_at >= ? and completed_at <= ?", start_date, end_date)}

  def fee
    case amount
    when 0..50.99
      1
    when 51..300.99
      0.95
    else 300
      0.85
    end
  end

  def commission
    (amount * fee / 100).floor(2)
  end

  def disbursement
    amount - commission 
  end

end
