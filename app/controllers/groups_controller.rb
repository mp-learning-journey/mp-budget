class GroupsController < ApplicationController

    def index
        @groups = current_user.groups
    end

    def new
        @groups = Group.new
    end

    def create
        @group = Group.new(group_params)
        if @group.save
            redirect_to authenticated_root_path, notice: "Category created successful"
        else
            render :new
        end
    end

    protected

    def set_groups
        @groups = Group.find(params[:id])
    end
    
    def group_params
        params.require(:group).permit(:name, :icon)
    end
end
