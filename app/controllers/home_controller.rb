class HomeController < ApplicationController
  def index
    @q = params[:q].nil? ? '' : params[:q][:description_cont]
    @search = Store.ransack(params[:q])
    @stores = @search.result.page(params[:page]).per(10)
  end
end