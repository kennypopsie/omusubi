require "test_helper"

class StudiesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get studies_new_url
    assert_response :success
  end
end
