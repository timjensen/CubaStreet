class StaffsController < ApplicationController
  
  def index
    @staff = Staff.find(params[:id])
  end
end