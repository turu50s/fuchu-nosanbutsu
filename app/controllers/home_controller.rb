class HomeController < ApplicationController
  def index
    @q = params[:q].nil? ? '' : params[:q][:description_cont]
    @search = Store.ransack(params[:q])
    @stores = @search.result.page(params[:page]).per(10)
  end

  def new
    @store = Store.new
  end
  
  def create
    @store = Store.new(store_params)
    @store.save!
    redirect_to home_index_path, notice: "新規データを登録しました"
  end

  def edit
    @store = Store.find(params[:id])
  end
  
  def update
    store = Store.find(params[:id])
    store.update!(store_params)
    redirect_to home_index_path, notice: "データを更新しました"
  end

  def destroy
    store = Store.find(params[:id])
    store.destroy
    redirect_to home_index_path, notice: "データを削除しました"
  end

  private

  def store_params
    params.require(:store).permit(:name, :address, :description)
  end
end