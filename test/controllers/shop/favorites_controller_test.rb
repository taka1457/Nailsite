require 'test_helper'

class Shop::FavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get shop_favorites_create_url
    assert_response :success
  end

  test "should get destroy" do
    get shop_favorites_destroy_url
    assert_response :success
  end

end
