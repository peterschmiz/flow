class ProjectsController < ApplicationController
	before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
	before_action :correct_user, only: [:edit, :update, :destroy]

	def index
		@projects = Project.paginate(page: params[:page]).order('created_at DESC')
	end

	def show
		@users = []
		@project = Project.find(params[:id])
		@assignments = ProjectAssignment.where :project_id => @project.id
		@assignments.each do |assign|
			user = User.find(assign.user_id)
			@users << user
		end
	end

	def new
		@project = Project.new
	end

	def create
		@project                  = Project.new(project_params)
		deadlines                 = convert_deadlines(params[:project])
		@project.preview_deadline = deadlines[:preview_deadline]
		@project.live_deadline    = deadlines[:live_deadline]
		if @project.save
			flash[:info] = 'Project added succesfully!'
			redirect_to projects_path
		else
			render :new
		end
	end

	def edit
		@project = Project.find(params[:id])
	rescue ActiveRecord::RecordNotFound
		redirect_to projects_path
	end

	def update
		@project = Project.find(params[:id])
		deadlines = convert_deadlines(params[:project])
		@project.assign_attributes(project_params)
		@project.preview_deadline = deadlines[:preview_deadline]
		@project.live_deadline = deadlines[:live_deadline]
		if @project.save
			flash[:success] = 'Project updated!'
			redirect_to @project
		else
			render 'edit'
		end
	end

	def destroy
		Project.find(params[:id]).destroy
		flash[:success] = 'Project deleted!'
		redirect_to projects_path
	rescue ActiveRecord::DeleteRestrictionError => e
		flash[:danger] = 'Project is associated with a user! Can\'t be deleted!'
		redirect_to projects_path
	end

	private

	def project_params
		params.require(:project).permit(:name, :description, :active, :url, :owner_id,
		                                preview_deadline: [:year, :month, :day],
		                                live_deadline:    [:year, :month, :day])
	end

	def convert_deadlines(params)
		deadlines                    = {}
		preview_deadline_raw         = params[:preview_deadline]
		live_deadline_raw            = params[:live_deadline]
		deadlines[:preview_deadline] = (preview_deadline_raw[:year] + '-' + preview_deadline_raw[:month] + '-' + preview_deadline_raw[:day]).to_date
		deadlines[:live_deadline]    = (live_deadline_raw[:year] + '-' + live_deadline_raw[:month] + '-' + live_deadline_raw[:day]).to_date
		return deadlines
	end

	# Before filters

	# Confirms the correct user.
	def correct_user
		@project = Project.find(params[:id])
		redirect_to(root_url) unless current_user.id === @project.owner_id || current_user.admin?
	rescue ActiveRecord::RecordNotFound
		redirect_to projects_path
	end

end
