class GroupsController < ApplicationController

    def index
        @groups = current_user.groups
    end

    def new
        @groups = Group.new
    end

    protected

    def set_groups
        @groups = Group.find(params[:id])
    end
end
