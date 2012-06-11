class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_name(params[:session][:name])
  if user && user.authenticate(params[:session][:password])
    sign_in user
    redirect_to admin_home_path
  else
    flash[:error] = 'Invalid email/password combination' 
    render 'new'
  end
end
  
  def destroy
    sign_out
    redirect_to home_path
  end
end
