class PagesController < ApplicationController

  def show
    @page = Page.find(params[:id])
  end
  
  def edit
    #debugger
    @page = Page.find(params[:id])
  end
  
  def update
    @page = Page.find(params[:id])
    @page.update_attributes(params[:page])
    redirect_to(admin_home_path)
  end
end