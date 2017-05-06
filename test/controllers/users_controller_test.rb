require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
	  def setup
	    @user = users(:michael)
	    @other_user = users(:jeannot)
	  end

	  test "should redirect index when not logged in" do
      	get users_path
    	assert_redirected_to login_url
  	  end

	  test "should redirect edit when not logged in" do
	    get edit_user_url(@user)
	    assert_not flash.empty?
	    assert_redirected_to login_url
	  end

	  test "should redirect update when not logged in" do
	    patch user_url(@user), params: { user: { name: @user.name,
	                                              email: @user.email } }
	    assert_not flash.empty?
	    assert_redirected_to login_url
	  end


end
