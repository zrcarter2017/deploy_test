require 'test_helper'

class NotifiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @notify = notifies(:one)
  end

  test "should get index" do
    get notifies_url
    assert_response :success
  end

  test "should get new" do
    get new_notify_url
    assert_response :success
  end

  test "should create notify" do
    assert_difference('Notify.count') do
      post notifies_url, params: { notify: { entity_name: @notify.entity_name, first_name: @notify.first_name, last_name: @notify.last_name } }
    end

    assert_redirected_to notify_url(Notify.last)
  end

  test "should show notify" do
    get notify_url(@notify)
    assert_response :success
  end

  test "should get edit" do
    get edit_notify_url(@notify)
    assert_response :success
  end

  test "should update notify" do
    patch notify_url(@notify), params: { notify: { entity_name: @notify.entity_name, first_name: @notify.first_name, last_name: @notify.last_name } }
    assert_redirected_to notify_url(@notify)
  end

  test "should destroy notify" do
    assert_difference('Notify.count', -1) do
      delete notify_url(@notify)
    end

    assert_redirected_to notifies_url
  end
end
