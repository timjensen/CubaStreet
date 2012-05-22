class ProductsController < ApplicationController
  
  def index
    @pies = Product.where("pro_type = 'pie'")
    @sweets = Product.where("pro_type = 'sweet'")
    @breads = Product.where("pro_type = 'bread'")
    @sands = Product.where("pro_type = 'sand'")
    @miscs = Product.where("pro_type = 'misc'")
  end
  
  def edit
    @product = Product.find(params[:id])
  end
  
  def create
    @product = Product.new(params[:product])
    if @product.save
      flash[:success] = "Product Created Successfully"
      redirect_to(admin_products_path)
    else
      redirect_to(admin_products_path)
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
  
  def super
    @pies = Product.where("pro_type = 'pie'")
    @sweets = Product.where("pro_type = 'sweet'")
    @breads = Product.where("pro_type = 'bread'")
    @sands = Product.where("pro_type = 'sand'")
    @miscs = Product.where("pro_type = 'misc'")
  end
end