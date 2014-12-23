class UsersController < ApplicationController
	before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
	before_action :correct_user, only: [:edit, :update]
	before_action :admin_user, only: :destroy

	def index
		default_order = 'name'
		default_dir = 'ASC'
		sort_by = params[:sort_by]
		sort_dir = params[:sort_dir]

		if sort_dir && sort_dir == 'asc'
			default_dir = 'ASC'
		elsif sort_dir && sort_dir == 'desc'
			default_dir = 'DESC'
		end

		if sort_by && sort_by == 'id'
			default_order = 'id';
		elsif sort_by && sort_by == 'name'
			default_order = 'name'
		elsif sort_by && sort_by == 'email'
			default_order = 'email'
		elsif sort_by && sort_by == 'pos'
			default_order = 'position'
		end

		@users = User.paginate(page: params[:page]).order(default_order + ' ' + default_dir)
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:info] = 'Please contact admin to activate your account!'
			redirect_to root_url
		else
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	rescue ActiveRecord::RecordNotFound
		redirect_to users_path
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			flash[:success] = 'Profile updated!'
			redirect_to users_path
		else
			render 'edit'
		end
	end

	def destroy
		User.find(params[:id]).destroy
		flash[:success] = 'User deleted!'
		redirect_to users_url
	rescue ActiveRecord::DeleteRestrictionError => e
		flash[:danger] = 'User is booked for a project! Can\'t be deleted!'
		redirect_to users_url
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password,
		                             :password_confirmation, :position,
		                             :admin, :activated, :division_id)
	end

	# Before filters

	# Confirms the correct user.
	def correct_user
		@user = User.find(params[:id])
		redirect_to(root_url) unless current_user?(@user) || current_user.admin?
	rescue ActiveRecord::RecordNotFound
		redirect_to users_path
	end

	# Confirms an admin user.
	def admin_user
		redirect_to(root_url) unless current_user.admin?
	end

end
