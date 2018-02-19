require 'test_helper'

class DashboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get rental" do
    get dashboards_rental_url
    assert_response :success
  end

  test "should get offer" do
    get dashboards_offer_url
    assert_response :success
  end

end
