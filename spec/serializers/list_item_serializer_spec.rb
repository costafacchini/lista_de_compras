require "rails_helper"

describe ListItemSerializer do
  let(:product) { Product.new(id: 1, name: "Arroz") }

  let(:list_item) do
    list_item = ListItem.new(id: 123, quantity: 2, product: product)
    list_item
  end

  subject { described_class.new list_item }

  it "creates special JSON for the API" do
    expected = {
      list_item: {
        id: 123,
        quantity: 2,
        product: {
          id: 1,
          name: "Arroz"
        }
      }
    }.to_json

    expect(subject.to_json).to eql(expected)
  end
end
