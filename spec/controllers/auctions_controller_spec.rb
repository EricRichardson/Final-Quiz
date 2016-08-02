require 'rails_helper'

RSpec.describe AuctionsController, type: :controller do
  describe "#new" do
    it "renders new_template" do
      get :new
      expect(response).to render_template(:new)
    end

    it "sets an instantiates an auction variable" do
      get :new
      expect(assigns(:auction)).to be_a_new(Auction)
    end
  end

  describe "#create" do
    context "with valid paramaters" do
      
      before do
        @user = create(:user)
      end

      def valid_request
        post :create, {auction: build(:auction)}
      end

      it "saves the auction" do
        count_before = Auction.count
        valid_request
        count_after = Auction.count
        expect(count_after).to eq(count_before + 1)
      end

      it "redirects to the show product page" do
        valid_request
        expect(response).to redirect_to(auction_path(Auction.last))
      end
    end

    context "With invalid params" do
      def invalid_request
        post :create, auction: {title: "" }
      end

      it "does not save the auction" do
        count_before = Auction.count
        invalid_request
        count_after = Auction.count
        expect(count_after).to eq(count_before)
      end

      it "renders the new page" do
        invalid_request
        expect(response).to render_template(:new)
      end
    end


  end
end
