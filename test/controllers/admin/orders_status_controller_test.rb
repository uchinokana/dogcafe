require "test_helper"

class Admin::OrdersStatusControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get admin_orders_status_update_url
    assert_response :success
  end
end
