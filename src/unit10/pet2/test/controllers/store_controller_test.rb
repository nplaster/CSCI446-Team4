require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select '#columns #side a', minimum: 3
    assert_select '#main .entry', 1
    assert_select 'h3', 'Whiskers'
  end

  test "markup needed for store.js.coffee is in place" do
    get :index
    assert_select '.store .entry > img', 1
    assert_select '.entry input[type=submit]', 2
  end
end
