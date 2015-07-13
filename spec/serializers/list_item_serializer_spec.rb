require "rails_helper"

describe ListItemSerializer do
  let(:product) { build(:product, id: 1) }

  subject { described_class.new build(:list_item, id: 123, product: product) }

  it "creates special JSON for the API" do
    expected = {
      list_item: { id: 123, quantity: 1, product: { id: 1, name: "Arroz" } }
    }.to_json

    expect(subject.to_json).to eql(expected)
  end
end
