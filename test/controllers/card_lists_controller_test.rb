require 'test_helper'

class CardListsControllerTest < ActionController::TestCase
  setup do
    @card_list = card_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:card_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create card_list" do
    assert_difference('CardList.count') do
      post :create, card_list: {  }
    end

    assert_redirected_to card_list_path(assigns(:card_list))
  end

  test "should show card_list" do
    get :show, id: @card_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @card_list
    assert_response :success
  end

  test "should update card_list" do
    patch :update, id: @card_list, card_list: {  }
    assert_redirected_to card_list_path(assigns(:card_list))
  end

  test "should destroy card_list" do
    assert_difference('CardList.count', -1) do
      delete :destroy, id: @card_list
    end

    assert_redirected_to card_lists_path
  end
end
