require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  test "categoory should be valid" do
    @categoory = Category.new(name: "Sports")
    assert @categoory.valid?
  end

end