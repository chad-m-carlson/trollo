require 'test_helper'

class MasterTasksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get master_tasks_index_url
    assert_response :success
  end

  test "should get show" do
    get master_tasks_show_url
    assert_response :success
  end

  test "should get new" do
    get master_tasks_new_url
    assert_response :success
  end

  test "should get edit" do
    get master_tasks_edit_url
    assert_response :success
  end

end
