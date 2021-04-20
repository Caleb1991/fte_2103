require './lib/food_truck'
require './lib/item'

RSpec.describe FoodTruck do

  describe 'initialize' do
    it 'exists' do
      food_truck = FoodTruck.new('Rocky Mountain Pies')

      expect(food_truck).to be_an_instance_of(FoodTruck)
    end

    it 'has a name' do
      food_truck = FoodTruck.new('Rocky Mountain Pies')

      expect(food_truck.name).to eq('Rocky Mountain Pies')
    end

    it 'has no inventory by default' do
      food_truck = FoodTruck.new('Rocky Mountain Pies')

      expect(food_truck.inventory).to eq({})
    end
  end

  describe '#check_stock' do
    it 'checks stock of given item' do
      food_truck = FoodTruck.new('Rocky Mountain Pies')
      item_1 = Item.new(name: 'Peach Pie (Slice)', price: '$3.75')

      expect(food_truck.check_stock(item_1)).to eq(0)
    end
  end

  describe '#stock' do
    it 'stocks a given quantity of an item' do
      food_truck = FoodTruck.new('Rocky Mountain Pies')
      item_1 = Item.new(name: 'Peach Pie (Slice)', price: '$3.75')
      item_2 = Item.new(name: 'Apple Pie (Slice)', price: '$2.50')

      expect(food_truck.check_stock(item_1)).to eq(0)

      food_truck.stock(item_1, 30)

      expect(food_truck.check_stock(item_1)).to eq(30)

      food_truck.stock(item_2, 15)

      expected = {
        item_1 => 30,
        item_2 => 15
      }

      expect(food_truck.inventory).to eq(expected)
    end
  end

  describe '#potential_revenue' do
    it 'returns potential revenue for truck' do
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

      expect(food_truck_1.potential_revenue).to eq(148.75)
      expect(food_truck_2.potential_revenue).to eq(345.00)
      expect(food_truck_3.potential_revenue).to eq(243.75)
    end
  end
end
