class WelcomeController < ApplicationController
	skip_before_action :authenticate_user!
	def about
		render :layout => false
		end
end