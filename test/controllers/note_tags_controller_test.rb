require 'test_helper'

class NoteTagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @note_tag = note_tags(:one)
  end

  test "should get index" do
    get note_tags_url
    assert_response :success
  end

  test "should get new" do
    get new_note_tag_url
    assert_response :success
  end

  test "should create note_tag" do
    assert_difference('NoteTag.count') do
      post note_tags_url, params: { note_tag: { name: @note_tag.name } }
    end

    assert_redirected_to note_tag_url(NoteTag.last)
  end

  test "should show note_tag" do
    get note_tag_url(@note_tag)
    assert_response :success
  end

  test "should get edit" do
    get edit_note_tag_url(@note_tag)
    assert_response :success
  end

  test "should update note_tag" do
    patch note_tag_url(@note_tag), params: { note_tag: { name: @note_tag.name } }
    assert_redirected_to note_tag_url(@note_tag)
  end

  test "should destroy note_tag" do
    assert_difference('NoteTag.count', -1) do
      delete note_tag_url(@note_tag)
    end

    assert_redirected_to note_tags_url
  end
end
