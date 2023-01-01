require 'rails_helper'

RSpec.describe "Task10s", type: :request do
  describe "GET /task10" do
    it "returns http success" do
      get "/task10/output/?format=xml"
      expect(response).to have_http_status(:success)
    end
  end
end
