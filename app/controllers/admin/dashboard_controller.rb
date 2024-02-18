class Admin::DashboardController < ApplicationController
  def show
    @total_products = Product.count
  end
end
