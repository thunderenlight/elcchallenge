require 'test_helper'

class StandardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get standards_index_url
    assert_response :success
  end

  test "should get show" do
    get standards_show_url
    assert_response :success
  end

  test "should get import" do
    get standards_import_url
    assert_response :success
  end

  test "should get export" do
    get standards_export_url
    assert_response :success
  end

  test "should get destroy" do
    get standards_destroy_url
    assert_response :success
  end

end
