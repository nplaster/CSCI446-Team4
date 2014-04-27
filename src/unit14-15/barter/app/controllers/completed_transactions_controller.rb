class CompletedTransactionsController < ApplicationController
  before_action :set_completed_transaction, only: [:show, :edit, :update, :destroy]

  # GET /completed_transactions
  # GET /completed_transactions.json
  def index
    @completed_transactions = CompletedTransaction.all
  end

  # GET /completed_transactions/1
  # GET /completed_transactions/1.json
  def show
  end

  # GET /completed_transactions/new
  def new
    @completed_transaction = CompletedTransaction.new
  end

  # GET /completed_transactions/1/edit
  def edit
  end

  # POST /completed_transactions
  # POST /completed_transactions.json
  def create
    @completed_transaction = CompletedTransaction.new(completed_transaction_params)

    respond_to do |format|
      if @completed_transaction.save
        format.html { redirect_to @completed_transaction, notice: 'Completed transaction was successfully created.' }
        format.json { render action: 'show', status: :created, location: @completed_transaction }
      else
        format.html { render action: 'new' }
        format.json { render json: @completed_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /completed_transactions/1
  # PATCH/PUT /completed_transactions/1.json
  def update
    respond_to do |format|
      if @completed_transaction.update(completed_transaction_params)
        format.html { redirect_to @completed_transaction, notice: 'Completed transaction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @completed_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /completed_transactions/1
  # DELETE /completed_transactions/1.json
  def destroy
    @completed_transaction.destroy
    respond_to do |format|
      format.html { redirect_to completed_transactions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_completed_transaction
      @completed_transaction = CompletedTransaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def completed_transaction_params
      params.require(:completed_transaction).permit(:listing_item_id, :bid_item_id, :listing_user_id, :bid_user_id, :listing_verify, :bid_verify)
    end
end
