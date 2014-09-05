class ListsController < ApplicationController

  def index
    @lists = List.all
  end
  
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    if @list.save
      redirect_to @list
    else
      render 'new'
    end
  end

  def show
    @list = List.find(params[:id])
    @items = @list.items
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end
end
