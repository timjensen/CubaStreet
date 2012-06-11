class PagesController < ApplicationController
  before_filter :signed_in_user, :only => [:edit, :update]
  
  def show
    @page = Page.find(params[:id])
  end
  
  def edit
    @page = Page.find(params[:id])
  end
  
  def update
    @page = Page.find(params[:id])
    @page.update_attributes(params[:page])
    redirect_to(admin_home_path)
  end
  
   private

    def signed_in_user
      redirect_to admin_login_path, notice: "Please sign in." unless signed_in?
    end 
    
end