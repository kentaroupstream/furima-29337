class UsersController < ApplicationController

  def new
  end
  
  def create
    @user = User.new

    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

end
