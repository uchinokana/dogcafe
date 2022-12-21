require "test_helper"

class Public::Addresses　editControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_addresses　edit_index_url
    assert_response :success
  end

  test "should get update" do
    get public_addresses　edit_update_url
    assert_response :success
  end
end
