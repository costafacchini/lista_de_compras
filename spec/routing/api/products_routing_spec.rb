require "rails_helper"

RSpec.describe "routing to products", type: :routing do
  it { expect(get: "/api/products").to route_to('api/products#index') }

  it { expect(get: "/api/products/new").to_not route_to('api/products#new') }

  it do
    expect(get: "/api/products/1").to route_to(
      controller: "api/products",
      action: "show",
      id: "1"
    )
  end

  it "routes /api/products/1/edit to products#edit" do
    expect(get: "/api/products/1/edit").to_not route_to(
      controller: "api/products",
      action: "edit",
      id: "1"
    )
  end

  it "routes /api/products to products#create" do
    expect(post: "/api/products").to route_to(
      controller: "api/products",
      action: "create"
    )
  end

  it "routes /api/products/1 to products#update" do
    expect(patch: "/api/products/1").to route_to(
      controller: "api/products",
      action: "update",
      id: "1"
    )
  end

  it "routes /api/products/1 to products#delete" do
    expect(delete: "/api/products/1").to route_to(
      controller: "api/products",
      action: "destroy",
      id: "1"
    )
  end
end
