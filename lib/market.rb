class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    vendor_names = []
    @vendors.map do |vendor|
      vendor_names << vendor.name
    end
    p vendor_names
  end

  def vendors_that_sell(item)

    @vendors.find_all do |vendor|
      vendor.inventory[item] != 0
    end
  end

  def sorted_item_list
    sorted_list = @vendors.map do |vendor|
      vendor.inventory.keys
    end.flatten
    p sorted_list.uniq.sort
  end

  def total_inventory
    total_inventory = Hash.new(0)
    @vendors.each do |vendor|
      vendor.inventory.each do |item, amount|
        total_inventory[item] += amount
      end
    end
    total_inventory
  end
end
