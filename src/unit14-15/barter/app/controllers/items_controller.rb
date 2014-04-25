class ItemsController < ApplicationController
  before_filter :require_login
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    #@items = Item.all
    @items = Item.where(status:["Available"])
    #@items = Item.where(condition:["New","Good"])
    #@items = Item.where.not(condition:["New","Good"])
  end

  def detail
    #@items = Item.all
    @item_detail = Item.where(:id => params[:item_id])
    @listing_item_id = params[:item_id]
    @bids = Bid.where(:listing_item_id => params[:item_id])

    bidr = []
    @bids.each do |bid|
      bidr << bid.bid_item_id
    end

    @bid_items = Item.where(:id => bidr)
    #t.integer  "listing_item_id"
    #t.integer  "bid_item_id"
    @user_bid_items = Item.where(user_id:current_user, status:["Available"])


    @selection_items = []
    @user_bid_items.each { |d| @selection_items << [d.name, d.id]  }
    puts "XXXXXXXXXXX#{@selection_items}"
    #@items = Item.where(condition:["New","Good"])
    #@items = Item.where.not(condition:["New","Good"])
  end

  def list_item
    result = Item.where(:id => params[:item_id])
    @item = result[0]
    @item.status = "Listed"
    respond_to do |format|
      if @item.save
        format.html { redirect_to my_items_path, notice: 'Item was successfully listed.' }
        format.json { render action: 'show', status: :created, location: @item }
      else
        format.html { render action: 'new' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    @item.status = "Available"


    respond_to do |format|
      if @item.save
        format.html { redirect_to my_items_path, notice: 'Item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @item }
      else
        format.html { render action: 'new' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to my_items_path, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to my_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:item_image, :name, :description, :status, :condition)
    end
end
