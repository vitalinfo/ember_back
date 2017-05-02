class Api::V1::UsersController < ApplicationController
  def create
    user = User.create(user_params)
    respond_to do |format|
      format.json { render_json_success(user, 201) }
      format.html { redirect_to root_path }
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
