class PurchasesController < ApplicationController
  def index
    @groups = Purchase.find_by('group_id', params[:id])
  end

  def new
    @id = params[:group_id]
    @purchase = Purchase.new
  end

  def create
    @purchase = current_user.purchases.new(purchase_params)
    if @purchase.save
      redirect_to authenticated_root_path, notice: 'Category created successful'
    else
      render :new
    end
  end

  protected

  def purchase_params
    params.require(:purchase).permit(:group, :icon)
  end
end
