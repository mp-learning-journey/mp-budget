class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def show
    # @id = params[:id]
    @group = Group.find(params[:id])
    @purchases = Group.find(params[:id]).purchases
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

  def get_groups
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
