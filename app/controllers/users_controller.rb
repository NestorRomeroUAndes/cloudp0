class UsersController < Clearance::UsersController
  private

  def user_params
    params.require(:user).permit(:empresa, :email, :password)
  end
end
