module Admin
  class HomeController < BaseController
    def index
      @products = Product.all.map { |product| ProductPresenter.new(product) }

      prices = []
      total_prices = @products.map(&:price)
      prices << total_prices
      @prices = prices
    end
  end
end
