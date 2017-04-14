require 'test_helper'

class NotetypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @notetype = notetypes(:one)
  end

  test "should get index" do
    get notetypes_url
    assert_response :success
  end

  test "should get new" do
    get new_notetype_url
    assert_response :success
  end

  test "should create notetype" do
    assert_difference('Notetype.count') do
      post notetypes_url, params: { notetype: { note_interest_rate: @notetype.note_interest_rate, note_program: @notetype.note_program, note_type: @notetype.note_type } }
    end

    assert_redirected_to notetype_url(Notetype.last)
  end

  test "should show notetype" do
    get notetype_url(@notetype)
    assert_response :success
  end

  test "should get edit" do
    get edit_notetype_url(@notetype)
    assert_response :success
  end

  test "should update notetype" do
    patch notetype_url(@notetype), params: { notetype: { note_interest_rate: @notetype.note_interest_rate, note_program: @notetype.note_program, note_type: @notetype.note_type } }
    assert_redirected_to notetype_url(@notetype)
  end

  test "should destroy notetype" do
    assert_difference('Notetype.count', -1) do
      delete notetype_url(@notetype)
    end

    assert_redirected_to notetypes_url
  end
end
