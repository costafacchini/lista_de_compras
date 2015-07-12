require "rails_helper"

describe ProductSerializer do
  subject { described_class.new Product.new(id: 123, name: "some title") }

  it "creates special JSON for the API" do
    expected = { product: { id: 123, name: "some title" } }.to_json

    expect(subject.to_json).to eql(expected)
  end
end
