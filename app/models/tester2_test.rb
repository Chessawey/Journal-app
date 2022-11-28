require "test_helper"

# As a user, I want to create a category that can be used to organize my tasks
# As a User, I want to edit a category to update the category's details
# As a User, I want to view a category to show the category's details

class Tester2Test < ActiveSupport::TestCase
  test "Should create new data" do
    tester = Tester.new
    tester.name = 'Anna'
    tester.last_name = 'Cruz'
    tester.age = '25'
    assert tester.save, "New data saved"
  end
end
