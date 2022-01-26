class ProjectsController < ApplicationController
    before_action :logged_in_user, only: [:new]

    def new
        @exp = current_user.profile.experiences.find(params[:id])
        if @exp
            @project = @exp.projects.create
            flash[:success] = "Project added."
        else
            flash[:danger]="Error!!"
        end
        redirect_to edit_url
    end

end