class Admin::CategoriesController < ApplicationController
  # http_basic_authenticate_with name: ENV['ADMIN_USER'], password: ENV['ADMIN_PASS']
  # commented out while building page

  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
  end

end
