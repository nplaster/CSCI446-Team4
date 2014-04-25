class TransactionsController < ApplicationController
  before_filter :require_login
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new 
    @transaction.listing_item_id = params[:listing_item_id]

    @transaction.bid_item_id = params[:bid_item_id]
    @transaction.listing_user_id = params[:listing_user_id]
    @transaction.bid_user_id = params[:bid_user_id]
    @transaction.listing_verify = params[:listing_verify]
    @transaction.bid_verify = params[:bid_verify]
    respond_to do |format|
      if @transaction.save
        bids = Bid.where(:listing_item_id => params[:listing_item_id])
        
        bids.each do  |b| 
            it = Item.where(:id => b.bid_item_id)
            it[0].status = "Available" 
            it[0].save
        end
        
        it = Item.where(:id => params[:listing_item_id])
        it[0].status = "Sold"
        it[0].save

        it = Item.where(:id => params[:bid_item_id])
        it[0].status = "Sold"
        it[0].save

        bids.each { |b| b.destroy } 

        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        format.json { render action: 'show', status: :created, location: @transaction }
        
      else
        format.html { render action: 'new' }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:listing_item_id, :bid_item_id, :listing_user_id, :bid_user_id, :listing_verify, :bid_verify)
      #params
    end
end
