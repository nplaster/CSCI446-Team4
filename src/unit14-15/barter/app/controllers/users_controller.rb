class UsersController < ApplicationController
  def items
    #@items = Item.where(user_id:2)
    @items = Item.where(user_id:current_user)
    puts "XXX #{current_user}"
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_parms)
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render :new
    end
  end
  
  private
  
  def user_parms
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end