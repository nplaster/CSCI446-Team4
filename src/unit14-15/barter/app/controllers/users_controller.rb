class UsersController < ApplicationController
  def items
    @items = Item.where(user_id:current_user, status:['Available', 'Sold', 'Listed', 'Bid'])
  end

  def transactions
    transactions = Transaction.where("listing_user_id = #{current_user.id} or bid_user_id = #{current_user.id}")
    @trades = Array.new
    transactions.each do |t|
      tempHash = Hash.new
      if t.listing_user_id == current_user.id
        user_item = Item.where(id:t.listing_item_id)[0]
        other_item = Item.where(id:t.bid_item_id)[0]
        other_user = User.where(id:t.bid_user_id)[0]
        tempHash[:verified] = t.listing_verify 
      else
        other_item = Item.where(id:t.listing_item_id)[0]
        user_item = Item.where(id:t.bid_item_id)[0]
        other_user = User.where(id:t.listing_user_id)[0]
        tempHash[:verified] = t.bid_verify 
      end
      tempHash[:user_item] = user_item
      tempHash[:other_item] = other_item
      tempHash[:other_user] = other_user
      tempHash[:transaction_id] = t.id
      @trades << tempHash
    end

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
