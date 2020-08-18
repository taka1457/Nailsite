require 'test_helper'

class Shop::BookmarksControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get shop_bookmarks_create_url
    assert_response :success
  end

  test "should get destroy" do
    get shop_bookmarks_destroy_url
    assert_response :success
  end

end
