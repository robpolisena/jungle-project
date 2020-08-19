class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['username'], password: ENV['password'], except: :index

  def show
    @products = Product.count(:all)
    @categories = Category.count(:all)
  end
end
