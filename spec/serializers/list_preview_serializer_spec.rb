require "rails_helper"

describe ListPreviewSerializer do
  subject { described_class.new build(:list, id: 123) }

  it "creates special JSON for the API" do
    expected = { list_preview: { id: 123, name: "Mercado" } }.to_json
    expect(subject.to_json).to eql(expected)
  end
end
