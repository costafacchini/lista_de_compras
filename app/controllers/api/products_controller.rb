class Api::ProductsController < ApplicationController
  def index
    render json: Product.all
  end

  def show
    product = Product.find_by_id(params[:id])
    if product
      render json: product
    else
      render nothing: true, status: :no_content
    end
  end

  def create
    product = Product.new(filtered_params)

    if product.save
      render json: product, status: :created
    else
      render json: product.errors, status: :unprocessable_entity
    end
  end

  def update
    product = Product.find(params[:id])

    if product.update(filtered_params)
      render json: product
    else
      render json: product.errors, status: :unprocessable_entity
    end
  end

  def destroy
    product = Product.find(params[:id])

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
