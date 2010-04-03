class ListsController < ApplicationController
  def index
    @lists = List.all
  end
  
  def show
    @list = List.find(params[:id])
  end
  
  def new
    @list = List.new
  end
  
  def create
    @list = List.new(params[:list])
    if @list.save
      flash[:notice] = "Successfully created list."
      redirect_to @list
    else
      render :action => 'new'
    end
  end
  
  def edit
    @list = List.find(params[:id])
  end
  
  def update
    @list = List.find(params[:id])
    if @list.update_attributes(params[:list])
      flash[:notice] = "Successfully updated list."
      redirect_to @list
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @list = List.find(params[:id])
    @list.destroy
    flash[:notice] = "Successfully destroyed list."
    redirect_to lists_url
  end
end
