class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_product, only: [:show, :edit, :update, :destroy]
  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.build(product_params)
    if @product.save
      redirect_to products_path
    else
      render 'new'
    end
  end

  def update
    if @product.update(product_params)
      redirect_to products_path
    else
      render 'new'
    end
  end

  def index
    @products = Product.all
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :description, :color)
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
