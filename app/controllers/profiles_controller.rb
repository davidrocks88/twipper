class ProfilesController < ApplicationController
		def new
			@profile = Profile.new
		end

		def create
			@profile = Profile.new(profile_params)
			@profile.user = current_user
			if @profile.save
				flash[:success] = "Profile Successfully Created"
				redirect_to profile_path(current_user)
			else
				flash.now[:danger] = "Please fix erros below"
				render 'new'
			end



		end

		def show
			@profile = Profile.find(params[:id])
		end

		def profile_params
			params.require(:profile).permit(:description, :pic)
		end
end
