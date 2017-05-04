require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
	test 'login with invalid information' do
		get login_path
		assert_template 'sessions/new'
		post login_path, params: { session: { email: "", password: "" } }
		assert_template 'sessions/new'
		assert_not flash.empty?
		get root_path
		assert flash.empty?
	end

	def setup
	  @user = users(:michael)
	end

	test "login with valid information" do
	    post login_path, params: { email:    @user.email,
	                                          password: 'password' }
  	    assert_redirected_to '/pages/home'
  	    follow_redirect!
	    assert_template 'pages/home'
	    assert_select "a[href=?]", login_path, count: 0
	    assert_select "a[href=?]", logout_path
	    assert_select "a[href=?]", user_path(@user)
  	end

end
