require 'test_helper'

class PrototyepwssControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get prototyepwss_index_url
    assert_response :success
  end

end
