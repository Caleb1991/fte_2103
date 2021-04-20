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
end
