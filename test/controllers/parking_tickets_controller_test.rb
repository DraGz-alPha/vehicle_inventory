require 'test_helper'

class ParkingTicketsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get parking_tickets_index_url
    assert_response :success
  end

  test "should get show" do
    get parking_tickets_show_url
    assert_response :success
  end

end
