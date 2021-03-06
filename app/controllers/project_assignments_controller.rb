class ProjectAssignmentsController < ApplicationController
	before_action :logged_in_user, only: [:index, :edit, :destroy]

	def index
	end

	def show
	end

	def new
		if params[:id]
			@project = Project.find(params[:id])
		else
			redirect_to projects_path
		end
	end

	def create
		@project_assignment = ProjectAssignment.new(project_assignment_params)
		if @project_assignment.save
			flash[:info] = 'Project assignment added succesfully!'
			redirect_to projects_path
		else
			flash[:danger] = 'This user is already assigned to this project!'
			redirect_to assign_path(:id => params[:project_assignment][:project_id])
		end
	end

	def edit
	end

	def destroy
		ProjectAssignment.where(project_id: params[:project_id]).where(user_id: params[:user_id]).first.destroy
		flash[:success] = 'Assignment deleted!'
		redirect_to project_path(params[:project_id])
	end

	private

	def project_assignment_params
		params.require(:project_assignment).permit(:project_id, :user_id)
	end

end
