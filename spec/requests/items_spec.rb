require 'rails_helper'

RSpec.describe "Items", type: :request do
  let(:headers) { { "CONTENT_TYPE" => "application/json" } }

  describe "GET /itens" do
    it "should get itens" do
      get itens_path

      expect(response).to have_http_status(200)
    end
  end

  describe "POST /itens/create" do
    let(:params) do
      {
        title: "coisa",
        description: "description",
        value: "value",
        kind: "type",
        date: "2020/01/01"
       }.to_json
    end

    it "should create new item" do
      post itens_create_path, :params => params, :headers => headers
      
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /itens/multiple_creation" do
    let(:params) do
      {
        start_date: "2021/01/02",
        end_date: "2021/02/01",
        title: "coisa",
        description: "description",
        value: "value",
        kind: "type",
        date: "2020/01/01"
       }.to_json
    end

    it "should create multiples itens" do
      post itens_multiple_creation_path, :params => params, :headers => headers
      
      expect(response).to have_http_status(200)
    end
  end

  describe "PATCH /itens/check/:id" do
    let(:params) { { checked: true }.to_json }

    let(:item) do
      Item.new(
        {
          title: "coisa",
          description: "coisa",
          value: "coisa",
          kind: "coisa",
          checked: true,
          date: "2020/01/01".to_datetime
        }
      )
    end

    it "should mark an item as checked" do
      allow(Item).to receive(:update).and_return(item)

      patch itens_check_path(1), :params => params, :headers => headers
      
      expect(response).to have_http_status(200)
    end
  end
end
