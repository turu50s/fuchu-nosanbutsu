class HomeController < ApplicationController
  def index
    @search = Store.ransack(params[:q])
    @stores = @search.result
  end
end