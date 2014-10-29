class ItemsController < ApplicationController

  def search

  end
  
  def index

  @items = Item.where("updated_at >= ? AND updated_at <= ?", params[:from_filter], params[:to_filter]).where("done = ? OR missed = ?", true, true).order('updated_at ASC')
    
  end
  
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

  def destroy
    @list = List.find(params[:list_id])
    @item = @list.items.find(params[:id])
    if @item.destroy
      redirect_to @list
    else
      redirect_to @list
    end
  end

  def toggle_done
    @list = List.find(params[:list_id])
    @item = @list.items.find(params[:id])
    @item.toggle!(:done)
    redirect_to @list
  end
  

  def show
  end

  private

  def item_params
    params.require(:item).permit(:description, :deadline, :remind)
  end

end
