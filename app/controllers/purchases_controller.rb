class PurchasesController < ApplicationController
  def new
    @id = params[:group_id]
    @purchase = Purchase.new
    @page_name = 'New Purchase'
  end

  def create
    @purchase = current_user.purchases.new(purchase_params)
    if @purchase.save
      redirect_to group_path(params[:group_id]), notice: 'Purchase created successful'
    else
      render :new
    end
  end

  protected

  def purchase_params
    params.require(:purchase).permit(:group_id, :name, :amount)
  end
end
