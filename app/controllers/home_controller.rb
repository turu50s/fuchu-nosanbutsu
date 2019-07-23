class HomeController < ApplicationController
  def index
    if params[:q] == nil
      @q = ''
      @search = Store.ransack(params[:q])
    else
      if params[:q][:description_cont] != nil
        description = params[:q][:description_cont].split(/[\p{blank}\s]+/).flatten
        @q = description
      end
      @search = Store.ransack(description_cont_all: description, address_cont: params[:q][:address_cont])
    end
    
    @stores = @search.result.page(params[:page]).per(10)
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def show
    @store = Store.find(params[:id])
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