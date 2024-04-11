class SuppliersController < ApplicationController
  before_action :supplier_set, only: [:show, :edit, :update]
  def index
    @suppliers = Supplier.all
  end

  def show; end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(supplier_params)
    
    if @supplier.save
      redirect_to @supplier, notice: 'Fornecedor cadastrado com sucesso'
    else
      flash.now[:notice] = 'Fornecedor não cadastrado'
      render 'new'
    end
  end

  def edit; end

  def update
    if @supplier.update(supplier_params)
      redirect_to supplier_path(@supplier.id), notice: 'Fornecedor editado com sucesso'
    else
      flash.now[:notice] = "Fornecedor não atualizado"
      render 'edit'
    end
  end

  private
  def supplier_set
    @supplier = Supplier.find(params[:id])
  end

  def supplier_params
    supplier_params = params.require(:supplier).permit(:corporate_name, :brand_name, :city, :registration_number, :full_address, :state, :email)
  end
end