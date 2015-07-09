class Api::ProductsController < ApplicationController
  protect_from_forgery except: [:create, :update, :destroy]

  def index
    render json: Product.all
  end

  def new
    render json: Product.new
  end

  def show
    render json: Product.find(params[:id])
  end

  def create
    product = Product.new(filtered_params)

    if products.save
      render json: product, status: :created
    else
      render json: product.errors, status: :unprocessable_entity
    end
  end

  def update
    product = Product.params(params[:id])

    if product.update(filtered_params)
      render json: product
    else
      render json: product.errors, status: :unprocessable_entity
    end
  end

  def destroy
    product = Product.params(params[:id])

    if product.destroy
      render json: product
    else
      render json: product.errors, status: :unprocessable_entity
    end
  end

  private

  def filtered_params
    params.require(:product).permit(:name)
  end
end
