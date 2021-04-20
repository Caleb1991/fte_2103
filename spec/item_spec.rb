require './lib/item'

RSpec.describe Item do

  describe 'initialize' do
    it 'exists' do
      item_1 = Item.new(name: 'Peach Pie (Slice)', price: '$3.75')

      expect(item_1).to be_an_instance_of(Item)
    end

    it 'has a name' do
      item_1 = Item.new(name: 'Peach Pie (Slice)', price: '$3.75')

      expect(item.name).to eq('Peach Pie (Slice)')
    end

    it 'has a price' do
      item_1 = Item.new(name: 'Peach Pie (Slice)', price: '$3.75')

      expect(item_1.price).to eq(3.75)
    end
  end
end
