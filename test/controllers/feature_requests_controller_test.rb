require 'test_helper'

class FeatureRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @feature_request = feature_requests(:one)
  end

  test "should get index" do
    get feature_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_feature_request_url
    assert_response :success
  end

  test "should create feature_request" do
    assert_difference('FeatureRequest.count') do
      post feature_requests_url, params: { feature_request: { client_id: @feature_request.client_id, client_priority: @feature_request.client_priority, descrtiption: @feature_request.descrtiption, product_area: @feature_request.product_area, target_date: @feature_request.target_date, ticket_url: @feature_request.ticket_url, title: @feature_request.title } }
    end

    assert_redirected_to feature_request_url(FeatureRequest.last)
  end

  test "should show feature_request" do
    get feature_request_url(@feature_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_feature_request_url(@feature_request)
    assert_response :success
  end

  test "should update feature_request" do
    patch feature_request_url(@feature_request), params: { feature_request: { client_id: @feature_request.client_id, client_priority: @feature_request.client_priority, descrtiption: @feature_request.descrtiption, product_area: @feature_request.product_area, target_date: @feature_request.target_date, ticket_url: @feature_request.ticket_url, title: @feature_request.title } }
    assert_redirected_to feature_request_url(@feature_request)
  end

  test "should destroy feature_request" do
    assert_difference('FeatureRequest.count', -1) do
      delete feature_request_url(@feature_request)
    end

    assert_redirected_to feature_requests_url
  end
end
