class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show_user]

  def index
    @users = User.all
  end

  def edit
   @user = current_user
  end

  def edit_profile
    @user = current_user
  end

  def show
   @user = User.find(current_user.id)
  end

  def show_user

  end


  def update_password
    @user = User.find(current_user.id)
    if @user.update_with_password(user_params)
      # Sign in the user by passing validation in case their password changed
      bypass_sign_in(@user)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def update_profile
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to root_path
  else
    render 'edit_profile'
      end
  end

  def set_role
    puts "="*100
    p params

    role_parameter = params[:role_id]
    User.find(params[:user_id]).add_role(role_parameter)
    role_changed = true

    render json: { role_changed: role_changed}

  end

  def remove_role
    puts "="*100
    p params
    role_parameter = params[:role_id]
    User.find(params[:user_id]).remove_role(role_parameter)



  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    # NOTE: Using `strong_parameters` gem
    params.require(:user).permit(:password, :password_confirmation, :current_password, :login, :full_name, :birthday, :address, :city, :state, :country,:zip)
  end

end