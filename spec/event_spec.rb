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
end
