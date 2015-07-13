require "rails_helper"

RSpec.describe Api::ProductsController, type: :controller do
  describe "GET #index" do
    let!(:arroz) { create :product, name: "Arroz" }
    let!(:sabao) { create :product, name: "Sabão" }

    before { get :index }

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to have_http_status(200)
    end

    it "renders the JSON" do
      expected = ActiveModel::ArraySerializer.new([arroz, sabao],
        each_serializer: ProductSerializer, root: "products").to_json

      expect(response.body).to eq expected
    end
  end

  describe "GET #show" do
    context "valid params" do
      let(:product) { create :product }
      before { get :show, id: product }

      it "responds successfully with an HTTP 200 status code" do
        expect(response).to have_http_status(200)
      end

      it "renders the JSON" do
        expected = ProductSerializer.new(product).to_json

        expect(response.body).to eq expected
      end
    end

    context "invalid params" do
      before { get :show, id: 1 }

      it "responds successfully with an HTTP 204 status code" do
        expect(response).to have_http_status(204)
      end

      it "renders the JSON" do
        expect(response.body).to be_empty
      end
    end
  end

  describe "POST #create" do
    context "valid params" do
      before { post :create, product: { name: "Sabão" } }

      it "responds successfully with an HTTP 201 status code" do
        expect(response).to have_http_status(201)
      end

      it "renders the JSON" do
        expected = ProductSerializer.new(Product.last).to_json

        expect(response.body).to eq expected
      end

      it { should permit(:name).for(:create) }
    end

    context "invalid params" do
      before { post :create, product: { name: nil } }

      it "responds successfully with an HTTP 422 status code" do
        expect(response).to have_http_status 422
      end

      it "renders the errors" do
        expect(response.body).to match(/can't be blank/)
      end
    end
  end

  describe "PATCH #update" do
    let!(:product) { create :product, name: "Sabão" }

    context "valid params" do
      before { patch :update, id: product, product: { name: "Arroz" } }

      it "responds successfully with an HTTP 201 status code" do
        expect(response).to have_http_status(200)
      end

      it "renders the JSON" do
        expect(response.body).to match(/Arroz/)
      end

      it "updates the product" do
        product.reload
        expect(product.name).to eq "Arroz"
      end

      it { should permit(:name).for(:update, params: { id: product.id }) }
    end

    context "invalid params" do
      before { patch :update, id: product, product: { name: nil } }

      it "responds successfully with an HTTP 422 status code" do
        expect(response).to have_http_status 422
      end

      it "renders the errors" do
        expect(response.body).to match(/can't be blank/)
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:product) { create :product }
    let(:destroy_product!) { delete :destroy, id: product }

    context "valid params" do
      it "responds successfully with an HTTP 200 status code" do
        destroy_product!

        expect(response).to have_http_status(200)
      end

      it "renders the JSON" do
        destroy_product!

        expected = ProductSerializer.new(product).to_json
        expect(response.body).to eq expected
      end

      it "destroy the product" do
        expect { destroy_product! }.to change(Product, :count).by(-1)
      end
    end

    context "invalid params" do
      let!(:list_item) { create :list_item, product: product }
      before { destroy_product! }

      it "responds successfully with an HTTP 422 status code" do
        expect(response).to have_http_status 422
      end
      it "responds successfully with an HTTP 422 status code" do
        expect(response.body).to match(/Cannot delete/)
      end
    end
  end
end
