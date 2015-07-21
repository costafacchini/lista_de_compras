class Api::ListsController < ApplicationController
  protect_from_forgery except: [:create, :update, :destroy]

  def index
    render json: List.all, each_serializer: ListPreviewSerializer
  end

  def show
    list = List.find_by_id(params[:id])
    if list
      render json: list
    else
      render nothing: true, status: :no_content
    end
  end

  def create
    list = List.new(filtered_params)

    if list.save
      render json: list, status: :created
    else
      render json: list.errors, status: :unprocessable_entity
    end
  end

  def update
    list = List.find(params[:id])

    if list.update(filtered_params)
      render json: list
    else
      render json: list.errors, status: :unprocessable_entity
    end
  end

  def destroy
    list = List.find(params[:id])

    if list.destroy
      render json: list
    else
      render json: list.errors, status: :unprocessable_entity
    end
  end

  private

  def filtered_params
    params.require(:list).permit(:name, list_items_attributes: [
      :id, :list_id, :product_id, :quantity, :_destroy])
  end
end
