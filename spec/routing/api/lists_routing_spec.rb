require "rails_helper"

RSpec.describe "routing to lists", type: :routing do
  it { expect(get: "/api/lists").to route_to('api/lists#index') }

  it { expect(get: "/api/lists/new").to_not route_to('api/lists#new') }

  it do
    expect(get: "/api/lists/1").to route_to(
      controller: "api/lists",
      action: "show",
      id: "1"
    )
  end

  it "routes /api/lists/1/edit to lists#edit" do
    expect(get: "/api/lists/1/edit").to_not route_to(
      controller: "api/lists",
      action: "edit",
      id: "1"
    )
  end

  it "routes /api/lists to lists#create" do
    expect(post: "/api/lists").to route_to(
      controller: "api/lists",
      action: "create"
    )
  end

  it "routes /api/lists/1 to lists#update" do
    expect(patch: "/api/lists/1").to route_to(
      controller: "api/lists",
      action: "update",
      id: "1"
    )
  end

  it "routes /api/lists/1 to lists#delete" do
    expect(delete: "/api/lists/1").to route_to(
      controller: "api/lists",
      action: "destroy",
      id: "1"
    )
  end
end
