class HomeController < ApplicationController
  def index
    @search = Store.ransack(params[:q])
    @stores = @search.result.page(params[:page]).per(10)
  end
end