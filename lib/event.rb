class Event
  attr_reader :name,
              :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map do |truck|
      truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |truck|
      truck.inventory.include?(item)
    end
  end

  def sorted_item_list
    items_sold = []

    @food_trucks.each do |truck|
      truck.inventory.each do |item, quantity|
        items_sold << item.name
      end
    end
    items_sold.uniq.sort
  end

  def overstocked_items
    overstock = []

    @food_trucks.each do |truck|
      truck.inventory.each do |item, quantity|
        if food_trucks_that_sell(item).length >= 2 && total_quantity(item) > 50
          overstock << item
        end
      end
    end
    overstock.uniq
  end

  def total_quantity(item)
    quantity = 0

    @food_trucks.each do |truck|
      truck.inventory.each do |block_item, block_quantity|
        if block_item == item
          quantity += block_quantity
        end
      end
    end
    quantity
  end

  def total_inventory
    items = []

      @food_trucks.each do |truck|
      truck.inventory.each do |item, quantity|
        items << item
      end
    end

    unique_item_list = items.uniq

    hash = {}

    unique_item_list.each do |item|
      hash[item] = {
        quantity: total_quantity(item),
        food_trucks: food_trucks_that_sell(item)
      }
    end
    hash
  end

  def sell(item, quantity)
    if total_quantity(item) >= quantity

    end
  end

end
