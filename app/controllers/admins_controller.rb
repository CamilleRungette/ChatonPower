class AdminsController < ApplicationController
	before_action :authenticate_user
	before_action :is_admin, only: [:index, :show]


	def index
	end

	def new
		@user = current_user
	end

	def create
		current_user.update_attribute :admin, true
		redirect_to admin_path(current_user.id)
	end

	def show
		@user = current_user
	end


	private
	def authenticate_user
		redirect_to root_path unless user_signed_in?
	end

	def is_admin
		current_user.admin?
	end

end
