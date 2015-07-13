require "rails_helper"

describe ProductSerializer do
  subject { described_class.new build(:product, id: 123) }

  it "creates special JSON for the API" do
    expected = { product: { id: 123, name: "Arroz" } }.to_json

    expect(subject.to_json).to eql(expected)
  end
end
