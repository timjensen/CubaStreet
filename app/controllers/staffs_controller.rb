class StaffsController < ApplicationController
  
  def new
    @staff = Staff.new
  end
  
  def create
    @staff = Staff.new(params[:staff])
    if @staff.save
      flash[:success] = "Staff Profile Created Successfully"
      redirect_to(admin_staff_path)
    else
      flash[:fail] = "An Error Has Occured During Staff Profile Creation"
      redirect_to(admin_staff_path)
    end
  end
  
  def edit
    @staff = Staff.find(params[:id])
    @files = Dir.glob("app/assets/images/staffs/*").map{|a| File.basename(a)}
  end
  
  def update
    @staff = Staff.find(params[:id])
    if @staff.update_attributes(params[:staff])
      flash[:success] = "Profile updated"
      redirect_to admin_staff_path
    else
      flash[:fail] = "An Error has occured the profile was not updated"
      redirect_to admin_staff_path
    end
  end
  
  def index
    @staff = Staff.all
  end
  
  def showstaff
    @staffs = Staff.all
  end
  
  def destroy
    Staff.find(params[:id]).destroy
    flash[:success] = "Staff profile was destroyed."
    redirect_to admin_staff_path
  end
end