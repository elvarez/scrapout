class ItemsController < ApplicationController

  def new
    @list = List.find(params[:list_id])
    @item = Item.new
  end

  def create
    @list = List.find(params[:list_id])
    @item = current_user.items.build(item_params)
    @item.list = @list
    if @item.save
      redirect_to @list
    else
      redirect_to @list
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:description)
  end


end
