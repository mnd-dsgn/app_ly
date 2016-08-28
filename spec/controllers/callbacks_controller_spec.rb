require 'rails_helper'

RSpec.describe CallbacksController, type: :controller do

  describe "GET #google" do
    it "returns http success" do
      get :google
      expect(response).to have_http_status(:success)
    end
  end

end
