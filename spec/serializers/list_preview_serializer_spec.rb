require "rails_helper"

describe ListPreviewSerializer do

  let(:list_preview) do
    list_preview = List.new(id: 123, name: "Mercado")
    list_preview
  end

  subject { described_class.new list_preview }

  it "creates special JSON for the API" do
    expected = {
      list_preview: {
        id: 123,
        name: "Mercado"
      }
    }.to_json

    expect(subject.to_json).to eql(expected)
  end
end
