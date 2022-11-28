require "test_helper"

# As a user, I want to create a category that can be used to organize my tasks
# As a User, I want to edit a category to update the category's details
# As a User, I want to view a category to show the category's details

class TesterTest < ActiveSupport::TestCase
  test "Should create new data" do
    tester.name = 'Anna'
    tester.last_name = 'Cruz'
    tester.age = ''
    assert_not tester.save, "New data not saved (no age)"
  end

end
