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

      expect(food_truck.check_stock(item_1)).to eq(0)

      food_truck.stock(item_1, 30)

      expect(food_truck.check_stock(item_1)).to eq(30)
    end
  end 
end
