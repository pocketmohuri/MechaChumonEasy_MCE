require "test_helper"

class Admin::AdminOrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_admin_orders_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_admin_orders_show_url
    assert_response :success
  end
end
