require "test_helper"

class RhSystemControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rh_system_index_url
    assert_response :success
  end
end
