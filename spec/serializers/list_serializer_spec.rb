require "rails_helper"

describe ListSerializer do
  let(:list) { build(:list, :complete, id: 1) }

  subject { described_class.new list }

  it "creates special JSON for the API" do
    expected = {
      list: {
        id: 1,
        name: "Mercado",
        list_items: [{
          id: list.list_items.first.id,
          quantity: 1,
          product: {
            id: list.list_items.first.product.id,
            name: "Arroz"
          }
        }]
      }
    }.to_json

    expect(subject.to_json).to eql(expected)
  end
end
