require 'test_helper'

class InvestorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @investor = investors(:one)
  end

  test "should get index" do
    get investors_url
    assert_response :success
  end

  test "should get new" do
    get new_investor_url
    assert_response :success
  end

  test "should create investor" do
    assert_difference('Investor.count') do
      post investors_url, params: { investor: { address: @investor.address, broker: @investor.broker, city: @investor.city, email: @investor.email, entity_name: @investor.entity_name, first_name: @investor.first_name, investor_id: @investor.investor_id, last_name: @investor.last_name, rep: @investor.rep, state: @investor.state, zip: @investor.zip } }
    end

    assert_redirected_to investor_url(Investor.last)
  end

  test "should show investor" do
    get investor_url(@investor)
    assert_response :success
  end

  test "should get edit" do
    get edit_investor_url(@investor)
    assert_response :success
  end

  test "should update investor" do
    patch investor_url(@investor), params: { investor: { address: @investor.address, broker: @investor.broker, city: @investor.city, email: @investor.email, entity_name: @investor.entity_name, first_name: @investor.first_name, investor_id: @investor.investor_id, last_name: @investor.last_name, rep: @investor.rep, state: @investor.state, zip: @investor.zip } }
    assert_redirected_to investor_url(@investor)
  end

  test "should destroy investor" do
    assert_difference('Investor.count', -1) do
      delete investor_url(@investor)
    end

    assert_redirected_to investors_url
  end
end
