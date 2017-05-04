require 'test_helper'

class CriteriaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @criterium = criteria(:one)
  end

  test "should get index" do
    get criteria_url
    assert_response :success
  end

  test "should get new" do
    get new_criterium_url
    assert_response :success
  end

  test "should create criterium" do
    assert_difference('Criterium.count') do
      post criteria_url, params: { criterium: { NOTIFY_DATE: @criterium.NOTIFY_DATE, dollar_invest: @criterium.dollar_invest, email: @criterium.email, entity_name: @criterium.entity_name, first_name: @criterium.first_name, invest_date: @criterium.invest_date, last_name: @criterium.last_name, note_type: @criterium.note_type } }
    end

    assert_redirected_to criterium_url(Criterium.last)
  end

  test "should show criterium" do
    get criterium_url(@criterium)
    assert_response :success
  end

  test "should get edit" do
    get edit_criterium_url(@criterium)
    assert_response :success
  end

  test "should update criterium" do
    patch criterium_url(@criterium), params: { criterium: { NOTIFY_DATE: @criterium.NOTIFY_DATE, dollar_invest: @criterium.dollar_invest, email: @criterium.email, entity_name: @criterium.entity_name, first_name: @criterium.first_name, invest_date: @criterium.invest_date, last_name: @criterium.last_name, note_type: @criterium.note_type } }
    assert_redirected_to criterium_url(@criterium)
  end

  test "should destroy criterium" do
    assert_difference('Criterium.count', -1) do
      delete criterium_url(@criterium)
    end

    assert_redirected_to criteria_url
  end
end
