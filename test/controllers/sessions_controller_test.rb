require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "should_get_new" do
  	get login_path
  	assert_response :success
  end

end
