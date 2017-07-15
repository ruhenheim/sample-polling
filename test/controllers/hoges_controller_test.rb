require 'test_helper'

class HogesControllerTest < ActionDispatch::IntegrationTest
  test "should get start" do
    get hoges_start_url
    assert_response :success
  end

  test "should get fetch" do
    get hoges_fetch_url
    assert_response :success
  end

end
