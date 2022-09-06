require "test_helper"

class CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customers_index_url
    assert_response :success
  end

  test "should get edit" do
    get customers_edit_url
    assert_response :success
  end

  test "should get search" do
    get customers_search_url
    assert_response :success
  end
end
