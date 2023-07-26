class Order < ApplicationRecord
  has_many :wish_items, dependent: :delete_all

  before_save :set_subtotal
  before_validation :set_default_status, on: :create

  enum status: {
    processing_order: 1,
    processing_error: 2,
    waiting_payment: 3,
    payment_accepted: 4,
    payment_denied: 5,
    finished: 6
  }


  include LocalizedEnumerable

  def subtotal
    wish_items.collect { |wish_item| wish_item.valid? ? (wish_item.unit_price * wish_item.quantity) : 0 }.sum
  end

  def payment_method
    if credit_card == true
      'Cartão de Crédito'
    elsif debit_card == true
      'Cartão de Debito'
    elsif billet == true
      'Boleto Bancário'
    elsif pix == true
      'PIX'
    end
  end

  private

  def set_subtotal
    self[:subtotal] = subtotal
  end

  def set_default_status
    self.status = :processing_order
  end
end
