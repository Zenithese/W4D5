require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "get#index" do

    it "renders the users index" do
      get(:index)
      expect(response).to render_template(:index)
    end
  end

  describe "get#show" do
  before(:each) do
    create(:user)
  end
    it "renders the users show" do
      get(:show, params: { id: User.last })
      expect(response).to render_template(:show)
    end
  end

  describe "get#new" do
    it "renders the new template" do
      # allow(subject).to receive(:logged_in?).and_return(true)
      get(:new)
      expect(response).to render_template(:new)
    end
  end

  describe "post#create" do
  # before(:each) do
  #   create(:user)
    # allow(subject).to receive(:current_user).and_return(User.last)
  

  let(:valid_params) { { user: { username: "Ribbit", password: "passwoord" } } }
  let(:invalid_params) { { user: { us: "" } } }

    context "when the params are valid" do
      it "creates a new user" do
        post(:create, params: valid_params)
        expect(response).to redirect_to(user_url(User.last.id))
      end
    end

    context "when params are invaid" do
      it "flashes an error" do
        post(:create, params: invalid_params)
        expect(flash[:errors]).to be_present
      end
    end
  end




end