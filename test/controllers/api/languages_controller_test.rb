require 'test_helper'

class Api::LanguagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_languages_index_url
    assert_response :success
  end

end
