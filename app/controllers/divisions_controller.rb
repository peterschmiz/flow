class DivisionsController < ApplicationController
	before_action :logged_in_user, only: [:index, :edit, :update, :destroy]

	def index
		@divisions = Division.paginate(page: params[:page]).order('created_at DESC')
	end

	def show
		@division = Division.find(params[:id])
		@users = User.where(division_id: @division.id)
	end

	def new
		@division = Division.new
	end

	def create
		@division = Division.new(division_params)
		if @division.save
			flash[:info] = 'Division added succesfully!'
			redirect_to divisions_path
		else
			render 'new'
		end
	end

	def edit
		@division = Division.find(params[:id])
	rescue ActiveRecord::RecordNotFound
		redirect_to divisions_path
	end

	def update
		@division = Division.find(params[:id])
		if @division.save
			flash[:success] = 'Division updated!'
			redirect_to divisions_path
		else
			render 'edit'
		end
	end

	def destroy
		Division.find(params[:id]).destroy
		flash[:success] = 'Division deleted!'
		redirect_to divisions_path
	rescue ActiveRecord::DeleteRestrictionError
		flash[:danger] = 'Division is associated with a user! Can\'t be deleted!'
		redirect_to divisions_path
	end

	private

	def division_params
		params.require(:division).permit(:name, :description)
	end

end
