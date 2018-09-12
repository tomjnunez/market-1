require 'minitest/autorun'
require 'minitest/pride'
require './lib/vendor'
require './lib/market'

class MarketTest < Minitest::Test
  def setup
    @market = Market.new("South Pearl Street Farmers Market")
    @vendor_1 = Vendor.new("Rocky Mountain Fresh")
    @vendor_2 = Vendor.new("Ba-Nom-a-Nom")
    @vendor_3 = Vendor.new("Palisade Peach Shack")
  end
  
  def test_it_exists
    assert_instance_of Market, @market
  end

  def test_it_has_name
    expected = "South Pearl Street Farmers Market"
    assert_equal expected, @market.name
  end

  def test_it_starts_with_zero_vendors
      assert_equal ([]), @market.vendors
  end

  def test_it_can_add_vendors
    @market.add_vendor(@vendor_1)
    @market.add_vendor(@vendor_2)
    @market.add_vendor(@vendor_3)

    expected = [@vendor_1, @vendor_2, @vendor_3]
    assert_equal expected, @market.vendors
  end

  def test_it_can_return_vendor_names
    @market.add_vendor(@vendor_1)
    @market.add_vendor(@vendor_2)
    @market.add_vendor(@vendor_3)

    expected = ["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"]
    assert_equal expected, @market.vendor_names
  end

  def test_it_returns_vendors_that_sell_certain_item
    @market.add_vendor(@vendor_1)
    @market.add_vendor(@vendor_2)
    @market.add_vendor(@vendor_3)
    @vendor_1.stock("Peaches", 35)
    @vendor_3.stock("Peaches", 65)

    expected = [@vendor_1, @vendor_3]
    assert_equal expected, @market.vendors_that_sell("Peaches")
  end

  def test_it_can_sort_list
   @vendor_1.stock("Peaches", 35)
   @vendor_1.stock("Tomatoes", 7)
   @vendor_2.stock("Banana Nice Cream", 50)
   @vendor_2.stock("Peach-Raspberry Nice Cream", 25)
   @vendor_3.stock("Peaches", 65)
   @market.add_vendor(@vendor_1)
   @market.add_vendor(@vendor_2)
   @market.add_vendor(@vendor_3)

   expected = ["Banana Nice Cream", "Peach-Raspberry Nice Cream", "Peaches", "Tomatoes" ]
   assert_equal expected, @market.sorted_item_list
  end

  def test_it_can_total_inventory
    @vendor_1.stock("Peaches", 35)
    @vendor_1.stock("Tomatoes", 7)
    @vendor_2.stock("Banana Nice Cream", 50)
    @vendor_2.stock("Peach-Raspberry Nice Cream", 25)
    @vendor_3.stock("Peaches", 65)
    @market.add_vendor(@vendor_1)
    @market.add_vendor(@vendor_2)
    @market.add_vendor(@vendor_3)

    expected = {"Peaches"=>100, "Tomatoes"=>7, "Banana Nice Cream"=>50, "Peach-Raspberry Nice Cream"=>25}
    assert_equal expected, @market.total_inventory
  end

  def test_it_can_sell_items
    @vendor_1.stock("Peaches", 35)
    @vendor_1.stock("Tomatoes", 7)
    @vendor_2.stock("Banana Nice Cream", 50)
    @vendor_2.stock("Peach-Raspberry Nice Cream", 25)
    @vendor_3.stock("Peaches", 65)
    @market.add_vendor(@vendor_1)
    @market.add_vendor(@vendor_2)
    @market.add_vendor(@vendor_3)

    assert_equal false, @market.sell("Peaches", 200)
    assert_equal false, @market.sell("Onions", 1)
    assert_equal true, @market.sell("Banana Nice Cream", 5)
  end

  def test_it_can_move_stock
    skip
  end
end
