class ListsController < ApplicationController

before_action :signed_in_user, only: [:index, :create, :show, :destroy]
  
  def index
    @lists = current_user.lists.all
    @list = List.new
    if @lists.empty?
      redirect_to :action => 'new'
    end
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
    @list = current_user.lists.find_by(id: params[:id])
    if @list.nil?
      redirect_to :action => 'index'
    else
      @todo = @list.items.todo
      @missed = @list.items.missed
    end    
  end

  def destroy
    @list = List.find(params[:id])
    if @list.destroy
      redirect_to :action => 'index'
    else
      redirect_to :action => 'index'
    end
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end

#  def correct_user
#    @list = current_user.lists.find_by(id: params[:id])
#    redirect_to root_url if @list.nil?
#  end
end
