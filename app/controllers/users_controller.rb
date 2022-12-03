class UsersController < ApplicationController
  def create
    user=User.create(user_params)
    session[:user_id]=user.id
    render json: user
  end
  def show
    user=User.find(id: session[:user_id])
    if user
      render json: user
    else
      render json: {error:"not authorized"}, status: :unauthorized
    end
  end



  private
  def user_params
    params.permit([:username, :password, :passwors_confirmation])
  end
end
