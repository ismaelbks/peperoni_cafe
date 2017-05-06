require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest

	def setup
    	@user = users(:jeannot)
    	@admin     = users(:michael)
    	@non_admin = users(:lana)
 	end

  	test "index including pagination" do
    	log_in_as(@user)
    	get users_path
    	assert_template 'users/index'
    	assert_select 'div.pagination'
    	User.paginate(page: 1).each do |user|
      		assert user.name
      		assert_select 'img'
      	end
    end

    test "index as admin including pagination and delete links" do
    	log_in_as(@admin)
    	get users_path
    	assert_template 'users/index'
    	assert_select 'div.pagination'
    	first_page_of_users = User.paginate(page: 1)
    	first_page_of_users.each do |user|
       		assert user.name
      		assert_select 'img'
	      		unless user == @admin
	        	assert 'X'
	        	assert user.name
	      		assert_select 'img'
	      		end
    	end
    	assert_difference 'User.count', -1 do
      		delete user_path(@non_admin)
    	end
  	end

  	test "index as non-admin" do
    	log_in_as(@non_admin)
    	get users_path
    	assert_select 'a', text: 'delete', count: 0
  	end

end
