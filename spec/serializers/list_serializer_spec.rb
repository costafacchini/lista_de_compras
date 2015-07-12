require "rails_helper"

describe ListSerializer do
  let(:product) { Product.new(id: 1, name: "Arroz") }

  let(:list) do
    list = List.new(id: 123, name: "Mercado")
    list.list_items.build(id: 123, quantity: 2, product: product)
    list
  end

  subject { described_class.new list }

  it "creates special JSON for the API" do
    expected = {
      list: {
        id: 123,
        name: "Mercado",
        list_items: [{
          id: 123,
          quantity: 2,
          product: {
            id: 1,
            name: "Arroz"
          }
        }]
      }
    }.to_json

    expect(subject.to_json).to eql(expected)
  end
end
