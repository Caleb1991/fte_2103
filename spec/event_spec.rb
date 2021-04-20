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
end
