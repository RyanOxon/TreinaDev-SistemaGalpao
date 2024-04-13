class OrdersController < ApplicationController
  before_action :order_set, only: [:show]
  before_action :authenticate_user!, only: [:new]

  def new 
    @order = Order.new
    @warehouses = Warehouse.all
    @suppliers = Supplier.all
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    if @order.save
      flash[:notice] = "Pedido registrado com sucesso"
      redirect_to @order
    else
      flash.now[:alert] = "Pedido não registrado"
      render 'new'
    end
  end

  private
  def order_params
    order_params = params.require(:order).permit(:warehouse_id, :supplier_id, :estimated_delivery_date)
  end
  
  def order_set
    @order = Order.find(params[:id])
  end
end