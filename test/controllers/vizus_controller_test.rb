require 'test_helper'

class VizusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vizu = vizus(:one)
  end

  test "should get index" do
    get vizus_url
    assert_response :success
  end

  test "should get new" do
    get new_vizu_url
    assert_response :success
  end

  test "should create vizu" do
    assert_difference('Vizu.count') do
      post vizus_url, params: { vizu: {  } }
    end

    assert_redirected_to vizu_url(Vizu.last)
  end

  test "should show vizu" do
    get vizu_url(@vizu)
    assert_response :success
  end

  test "should get edit" do
    get edit_vizu_url(@vizu)
    assert_response :success
  end

  test "should update vizu" do
    patch vizu_url(@vizu), params: { vizu: {  } }
    assert_redirected_to vizu_url(@vizu)
  end

  test "should destroy vizu" do
    assert_difference('Vizu.count', -1) do
      delete vizu_url(@vizu)
    end

    assert_redirected_to vizus_url
  end
end
