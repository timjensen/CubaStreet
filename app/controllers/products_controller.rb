class ProductsController < ApplicationController
  
  def index
    @spec = Product.where("spec != ''").first
    @pies = Product.where("pro_type = 'pie'")
    @sweets = Product.where("pro_type = 'sweet'")
    @breads = Product.where("pro_type = 'bread'")
    @sands = Product.where("pro_type = 'sand'")
    @miscs = Product.where("pro_type = 'misc'")
  end
  
  def edit
    @product = Product.find(params[:id])
    @files = Dir.glob("app/assets/images/products/*").map{|a| File.basename(a)}
  end
  
  def create
    @product = Product.new(params[:product])
    if @product.save
      flash[:success] = "Product Created Successfully"
      redirect_to admin_products_path
    else
      redirect_to admin_products_path
    end
  end
  
  def new
    @product = Product.new
  end
  
  def destroy
    Product.find(params[:id]).destroy
    flash[:success] = "Product destroyed."
    redirect_to admin_products_path
  end
  
  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      flash[:success] = "Product updated"
      redirect_to admin_products_path
    else
      render 'edit'
    end
  end
  
  def showprod
    @products = Product.find(:all, :limit => 6, :order => "Random()")
  end
  
  def specup
    @product = Product.find(params[:id])
    @nulls = Product.all
    @nulls.each{ |e| e.update_attributes(:spec => "")}
    @product.update_attributes( :spec => DateTime.now.next_week )
    flash[:success] = "Product placed on promotion"
    redirect_to admin_products_path
  end
  
  def specdown
    @product = Product.find(params[:id])
    @product.update_attributes( :spec => "" )
    flash[:success] = "Product removed from promotion"
    redirect_to admin_products_path
  end
  
  def test
    
  end
  
  def uploadprod
    name = params[:upload][:file].original_filename
    directory = "app/assets/images/products"
    path = File.join(directory, name)
    File.open(path, "wb") { |f| f.write(params[:upload][:file].read) }
    flash[:success] = "File uploaded"
    redirect_to admin_products_path
  end
end