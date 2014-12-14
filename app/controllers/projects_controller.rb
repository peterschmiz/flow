class ProjectsController < ApplicationController
	before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
	before_action :correct_user, only: [:edit, :update, :destroy]
	helper BookingsHelper

	def index
		@projects = Project.paginate(page: params[:page]).order('created_at DESC')
	end

	def show
		@project = Project.find(params[:id])
		@users = get_assigned_users(@project.id)
		@divisions = Division.all.order(name: :asc)
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
		if params[:project]
			update_project(params)
		elsif params[:resource_update]
			update_resources(params)
			redirect_to @project
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

	def update_resources(params)
		id = -1
		unit = 0

		params.each do |key, val|
			raw = key.split('_')

			if raw[0] == 'division'
				id = raw[1]
				if val != ''
					if val.is_i?
						unit = val.to_i
						add_resource_need(id, unit)
					else
						if !flash.key?('warning')
							flash[:warning] = 'Project unit can be only number!<br>Unit for ' + Division.find(id).name + ' was not updated!'
						else
							flash[:warning] << '<br>Unit for ' + Division.find(id).name + ' was not updated!'
						end
					end
				end
			end

		end

	end

	def add_resource_need(division_id, unit)

		if ProjectResource.exists?(:division_id => division_id, :project_id => @project.id)
			@resource_need = ProjectResource.where(:division_id => division_id, :project_id => @project.id).first
		else
			@resource_need = ProjectResource.new
		end

		@resource_need.division_id = division_id
		@resource_need.project_id = @project.id
		@resource_need.unit = unit

		if @resource_need.save
			flash[:success] = 'Project resource needs updated!'
		else
			flash[:danger] = 'Project resource update error!'
		end
	end

	def update_project(params)
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

	def get_assigned_users(project_id)
		users = []
		assignments = ProjectAssignment.where :project_id => project_id
		assignments.each do |assign|
			user = User.where(id: assign.user_id).where(activated: true).first
			if user
				users << user
			end
		end
		return users
	end

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
