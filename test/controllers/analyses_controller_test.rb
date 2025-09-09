require "test_helper"

class AnalysesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get analyses_new_url
    assert_response :success
  end

  test "should get create" do
    get analyses_create_url
    assert_response :success
  end

  test "should get index" do
    get analyses_index_url
    assert_response :success
  end
end
