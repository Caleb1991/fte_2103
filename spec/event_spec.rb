require './lib/event'
require './lib/food_truck'
require './lib/item'

RSpec.describe Event do

  describe 'intialize' do
    it 'exists' do
      event = Event.new('South Pearl Street Farmers Market')

      expect(event).to be_an_instance_of(Event)
    end

    it 'has a name' do
      event = Event.new('South Pearl Street Farmers Market')

      expect(event.name).to eq('South Pearl Street Farmers Market')
    end

    it 'has no food trucks by default' do
      event = Event.new('South Pearl Street Farmers Market')

      expect(event.food_trucks).to eq([])
    end
  end

  describe '#add_food_truck' do
    it 'adds a food truck to food trucks array' do
      event = Event.new('South Pearl Street Farmers Market')
      food_truck_1 = FoodTruck.new('Rocky Mountain Pies')
      food_truck_2 = FoodTruck.new('Ba-Nom-a-Nom')
      food_truck_3 = FoodTruck.new('Palisade Peach Shack')

      event.add_food_truck(food_truck_1)
      event.add_food_truck(food_truck_2)
      event.add_food_truck(food_truck_3)

      expected = [food_truck_1, food_truck_2, food_truck_3]

      expect(event.food_trucks).to eq(expected)
    end
  end

  describe '#food_truck_names' do
    it 'returns all food truck names' do
      event = Event.new('South Pearl Street Farmers Market')
      food_truck_1 = FoodTruck.new('Rocky Mountain Pies')
      food_truck_2 = FoodTruck.new('Ba-Nom-a-Nom')
      food_truck_3 = FoodTruck.new('Palisade Peach Shack')

      event.add_food_truck(food_truck_1)
      event.add_food_truck(food_truck_2)
      event.add_food_truck(food_truck_3)

      expected = ['Rocky Mountain Pies', 'Ba-Nom-a-Nom', 'Palisade Peach Shack']

      expect(event.food_truck_names).to eq(expected)
    end
  end

  describe '#food_trucks_that_sell' do
    it 'returns all trucks that sell a given item' do
      event = Event.new('South Pearl Street Farmers Market')
      food_truck_1 = FoodTruck.new('Rocky Mountain Pies')
      item_1 = Item.new(name: 'Peach Pie (Slice)', price: '$3.75')
      item_2 = Item.new(name: 'Apple Pie (Slice)', price: '$2.50')
      item_3 = Item.new(name: 'Peach-Raspberry Nice Cream', price: '$5.30')
      item_4 = Item.new(name: 'Banana Nice Creamm', price: '$4.25')
      food_truck_2 = FoodTruck.new('Ba-Nom-a-Nom')
      food_truck_3 = FoodTruck.new('Palisade Peach Shack')

      food_truck_1.stock(item_1, 35)
      food_truck_1.stock(item_2, 7)
      food_truck_2.stock(item_3, 25)
      food_truck_2.stock(item_4, 50)
      food_truck_3.stock(item_1, 65)
      event.add_food_truck(food_truck_1)
      event.add_food_truck(food_truck_2)
      event.add_food_truck(food_truck_3)

      expected = [food_truck_1, food_truck_3]

      expect(event.food_trucks_that_sell(item_1)).to eq(expected)
    end
  end

  describe '#sorted_item_list' do
    it 'returns all items stocked by food trucks alphabetically' do
      event = Event.new('South Pearl Street Farmers Market')
      food_truck_1 = FoodTruck.new('Rocky Mountain Pies')
      item_1 = Item.new(name: 'Peach Pie (Slice)', price: '$3.75')
      item_2 = Item.new(name: 'Apple Pie (Slice)', price: '$2.50')
      item_3 = Item.new(name: 'Peach-Raspberry Nice Cream', price: '$5.30')
      item_4 = Item.new(name: 'Banana Nice Cream', price: '$4.25')
      food_truck_2 = FoodTruck.new('Ba-Nom-a-Nom')
      food_truck_3 = FoodTruck.new('Palisade Peach Shack')

      food_truck_1.stock(item_1, 35)
      food_truck_1.stock(item_2, 7)
      food_truck_2.stock(item_3, 25)
      food_truck_2.stock(item_4, 50)
      food_truck_3.stock(item_1, 65)
      event.add_food_truck(food_truck_1)
      event.add_food_truck(food_truck_2)
      event.add_food_truck(food_truck_3)

      expected = ['Apple Pie (Slice)', 'Banana Nice Cream', 'Peach Pie (Slice)', 'Peach-Raspberry Nice Cream']

      expect(event.sorted_item_list).to eq(expected)
    end
  end

  describe '#overstocked_items' do
    it 'shows which items are sold by more than one truck and quantity is over 50' do
      event = Event.new('South Pearl Street Farmers Market')
      food_truck_1 = FoodTruck.new('Rocky Mountain Pies')
      item_1 = Item.new(name: 'Peach Pie (Slice)', price: '$3.75')
      item_2 = Item.new(name: 'Apple Pie (Slice)', price: '$2.50')
      item_3 = Item.new(name: 'Peach-Raspberry Nice Cream', price: '$5.30')
      item_4 = Item.new(name: 'Banana Nice Creamm', price: '$4.25')
      food_truck_2 = FoodTruck.new('Ba-Nom-a-Nom')
      food_truck_3 = FoodTruck.new('Palisade Peach Shack')

      food_truck_1.stock(item_1, 35)
      food_truck_1.stock(item_2, 7)
      food_truck_2.stock(item_3, 25)
      food_truck_2.stock(item_4, 50)
      food_truck_3.stock(item_1, 65)
      event.add_food_truck(food_truck_1)
      event.add_food_truck(food_truck_2)
      event.add_food_truck(food_truck_3)

      expect(event.overstocked_items).to eq([item_1])
    end
  end

  describe '#total_quantity' do
    it 'returns total quantity of given item over all trucks' do
      event = Event.new('South Pearl Street Farmers Market')
      food_truck_1 = FoodTruck.new('Rocky Mountain Pies')
      item_1 = Item.new(name: 'Peach Pie (Slice)', price: '$3.75')
      item_2 = Item.new(name: 'Apple Pie (Slice)', price: '$2.50')
      item_3 = Item.new(name: 'Peach-Raspberry Nice Cream', price: '$5.30')
      item_4 = Item.new(name: 'Banana Nice Creamm', price: '$4.25')
      food_truck_2 = FoodTruck.new('Ba-Nom-a-Nom')
      food_truck_3 = FoodTruck.new('Palisade Peach Shack')

      food_truck_1.stock(item_1, 35)
      food_truck_1.stock(item_2, 7)
      food_truck_2.stock(item_3, 25)
      food_truck_2.stock(item_4, 50)
      food_truck_3.stock(item_1, 65)
      event.add_food_truck(food_truck_1)
      event.add_food_truck(food_truck_2)
      event.add_food_truck(food_truck_3)

      expect(event.total_quantity(item_1)).to eq(100)
    end
  end

  describe '#total_inventory' do
    it 'returns hash with item as key and value being a hash of total qunatity and food trucks that sell that item' do
      event = Event.new('South Pearl Street Farmers Market')
      food_truck_1 = FoodTruck.new('Rocky Mountain Pies')
      item_1 = Item.new(name: 'Peach Pie (Slice)', price: '$3.75')
      item_2 = Item.new(name: 'Apple Pie (Slice)', price: '$2.50')
      item_3 = Item.new(name: 'Peach-Raspberry Nice Cream', price: '$5.30')
      item_4 = Item.new(name: 'Banana Nice Cream', price: '$4.25')
      food_truck_2 = FoodTruck.new('Ba-Nom-a-Nom')
      food_truck_3 = FoodTruck.new('Palisade Peach Shack')

      food_truck_1.stock(item_1, 35)
      food_truck_1.stock(item_2, 7)
      food_truck_2.stock(item_3, 25)
      food_truck_2.stock(item_4, 50)
      food_truck_3.stock(item_1, 65)
      food_truck_3.stock(item_3, 10)
      event.add_food_truck(food_truck_1)
      event.add_food_truck(food_truck_2)
      event.add_food_truck(food_truck_3)

      expected = {
        item_1 => {
          quantity: 100,
          food_trucks: [food_truck_1, food_truck_3]
        },
        item_2 => {
          quantity: 7,
          food_trucks: [food_truck_1]
        },
        item_3 => {
          quantity: 35,
          food_trucks: [food_truck_2, food_truck_3]
        },
        item_4 => {
          quantity: 50,
          food_trucks: [food_truck_2]
        }
      }

      expect(event.total_inventory).to eq(expected)
    end
  end

  describe '#sell' do
    it 'is a big yikes' do
      event = Event.new('South Pearl Street Farmers Market')
      food_truck_1 = FoodTruck.new('Rocky Mountain Pies')
      item_1 = Item.new(name: 'Peach Pie (Slice)', price: '$3.75')
      item_2 = Item.new(name: 'Apple Pie (Slice)', price: '$2.50')
      item_3 = Item.new(name: 'Peach-Raspberry Nice Cream', price: '$5.30')
      item_4 = Item.new(name: 'Banana Nice Cream', price: '$4.25')
      food_truck_2 = FoodTruck.new('Ba-Nom-a-Nom')
      food_truck_3 = FoodTruck.new('Palisade Peach Shack')

      food_truck_1.stock(item_1, 35)
      food_truck_1.stock(item_2, 7)
      food_truck_2.stock(item_3, 25)
      food_truck_2.stock(item_4, 50)
      food_truck_3.stock(item_1, 65)
      food_truck_3.stock(item_3, 10)
      event.add_food_truck(food_truck_1)
      event.add_food_truck(food_truck_2)
      event.add_food_truck(food_truck_3)

      expect(event.sell(item_1, 33)).to eq(true)

      event.sell(item_1, 37)

      expect(food_truck_1.check_stock(item_1)).to eq(0)
      expect(food_truck_3.check_stock(item_1)).to eq(63)
    end
  end
end
