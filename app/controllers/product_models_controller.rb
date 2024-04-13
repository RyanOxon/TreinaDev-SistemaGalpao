class ProductModelsController < ApplicationController
  before_action :product_model_set, only: [:show]
  before_action :authenticate_user!, only: [:index]

  def index
    @product_models = ProductModel.all
  end

  def new
    @product_model = ProductModel.new
    @suppliers = Supplier.all
  end

  def create
    @product_model = ProductModel.new(product_model_params)
    @suppliers = Supplier.all
    if @product_model.save
      redirect_to @product_model, notice: 'Modelo de produto cadastrado com sucesso'
    else
      flash.now[:alert] = "Modelo de produto não cadastrado"
      render 'new'
    end
  end

  private
  def product_model_params
    product_model_params = params.require(:product_model).permit(:name, :weight, :width, :height, :depth, :sku, :supplier_id)
  end

  def product_model_set
    @product_model = ProductModel.find(params[:id])
  end
end