class UploadController < ApplicationController
  def new
    
  end

  def create
   name = params[:upload][:file].original_filename
    directory = "app/assets/images/products"
    path = File.join(directory, name)
    File.open(path, "wb") { |f| f.write(params[:upload][:file].read) }
    flash[:success] = "File uploaded"
    redirect_to admin_products_path
  end
end
