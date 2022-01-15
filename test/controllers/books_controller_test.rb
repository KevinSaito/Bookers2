require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get rails" do
    get books_rails_url
    assert_response :success
  end

  test "should get db:migrate" do
    get books_db:migrate_url
    assert_response :success
  end
end
