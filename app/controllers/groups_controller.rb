class GroupsController < ApplicationController
  before_action :set_group, except: %i[index new create]

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def show
    @purchases = @group.purchases.order(created_at: :desc)
    @total = @purchases.sum(:amount)
  end

  def create
    @group = current_user.groups.new(group_params)
    if @group.save
      redirect_to authenticated_root_path, notice: 'Category created successful'
    else
      render :new
    end
  end

  protected

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
