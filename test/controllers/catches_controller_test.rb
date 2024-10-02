require "test_helper"

class CatchesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get catches_new_url
    assert_response :success
  end

  test "should get create" do
    get catches_create_url
    assert_response :success
  end

  test "should get index" do
    get catches_index_url
    assert_response :success
  end
end
