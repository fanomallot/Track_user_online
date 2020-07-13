class UsersController < ApplicationController
  before_action :authenticate_user!,except: [:index]
  def index
    @users = User.all
    @online = User.where('last_seen_at > ?', 5.minutes.ago)
  end

  def show
    @user = current_user
  end

  def edit
  end

  def update
    user = User.find(params[:id])
    user.update(name: params[:name], age: params[:age],email: params[:email],adress: params[:adress])
    if user.save
      redirect_to user_path(params[:id])
    else
      render edit
    end
  end

  def destroy
  end
end
