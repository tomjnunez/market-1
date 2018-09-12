require 'minitest/autorun'
require 'minitest/pride'
require './lib/vendor'

class VenderTest < Minitest::Test
  def setup
    @vendor = Vendor.new("Rocky Mountain Fresh")

  end

  def test_it_exists
    assert_instance_of Vendor, @vendor
  end

  def test_it_has_name
    assert_equal ("Rocky Mountain Fresh"), @vendor.name
  end

  def test_its_inventory_starts_empty
    assert_equal ({}), @vendor.inventory
  end

  def test_items_not_in_stock_equal_zero
    assert_equal 0, @vendor.check_stock("Peaches")
  end

  def test_it_can_stock_items
    assert_equal 30, @vendor.stock("Peaches", 30)
  end

  def test_it_can_print_inventory
    @vendor.stock("Peaches", 30)
    @vendor.stock("Peaches", 25)
    @vendor.stock("Tomatoes", 12)

    expected = {"Peaches"=>55, "Tomatoes"=>12}
    assert_equal expected, @vendor.inventory
  end
end
