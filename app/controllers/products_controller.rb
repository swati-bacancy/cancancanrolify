class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_product, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def new
    @product = Product.new
    # authorize! :create, @product
  end

  def create
    @product = current_user.products.build(product_params)
    # authorize! :create, @product
    if @product.save
      redirect_to products_path
    else
      render 'new'
    end
  end

  def update
    # authorize! :update, @product
    if @product.update(product_params)
      redirect_to products_path
    else
      render 'new'
    end
  end

  def index
    @products = Product.all
    # authorize! :index, @products
  end

  def destroy
    # authorize! :destroy, @product
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
