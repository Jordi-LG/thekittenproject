class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
      user_params = params.require(:user).permit(:first_name, :last_name)
        if @user.update(user_params)
          flash[:success] = "Votre profil a bien été mise a jour"
          redirect_to user_path(@user.id)
        else
          render :edit
        end 
  end
end
