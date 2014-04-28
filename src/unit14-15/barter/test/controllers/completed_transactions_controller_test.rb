require 'test_helper'

class CompletedTransactionsControllerTest < ActionController::TestCase
=begin
  setup do
    @completed_transaction = completed_transactions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:completed_transactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create completed_transaction" do
    assert_difference('CompletedTransaction.count') do
      post :create, completed_transaction: { bid_item_id: @completed_transaction.bid_item_id, bid_user_id: @completed_transaction.bid_user_id, bid_verify: @completed_transaction.bid_verify, listing_item_id: @completed_transaction.listing_item_id, listing_user_id: @completed_transaction.listing_user_id, listing_verify: @completed_transaction.listing_verify }
    end

    assert_redirected_to completed_transaction_path(assigns(:completed_transaction))
  end

  test "should show completed_transaction" do
    get :show, id: @completed_transaction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @completed_transaction
    assert_response :success
  end

  test "should update completed_transaction" do
    patch :update, id: @completed_transaction, completed_transaction: { bid_item_id: @completed_transaction.bid_item_id, bid_user_id: @completed_transaction.bid_user_id, bid_verify: @completed_transaction.bid_verify, listing_item_id: @completed_transaction.listing_item_id, listing_user_id: @completed_transaction.listing_user_id, listing_verify: @completed_transaction.listing_verify }
    assert_redirected_to completed_transaction_path(assigns(:completed_transaction))
  end

  test "should destroy completed_transaction" do
    assert_difference('CompletedTransaction.count', -1) do
      delete :destroy, id: @completed_transaction
    end

    assert_redirected_to completed_transactions_path
  end
=end
end
