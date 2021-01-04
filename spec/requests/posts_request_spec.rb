require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "#index" do
    context "as an authenticated user" do
      before do
        @user = create(:user)
      end

      it "returns a 200 response" do
        sign_in @user
        get "/posts/index"
        expect(response).to have_http_status(200)
      end
    end

    context "as a guest" do
      it "return a 302 response" do
        get "/posts/index"
        expect(response).to have_http_status(302)
      end

      it "redirect to root" do
        get "/posts/index"
        expect(response).to redirect_to "/"
      end
    end
  end

  describe "#new" do
    context "as an authenticated user" do
      before do
        @user = create(:user)
      end

      it "returns a 200 response" do
        sign_in @user
        get "/posts/new"
        expect(response).to have_http_status(200)
      end
    end

    context "as a guest" do
      it "returns a 302 response" do
        get "/posts/new"
        expect(response).to have_http_status(302)
      end

      it "redirect to root" do
        get "/posts/index"
        expect(response).to redirect_to "/"
      end
    end
  end

  describe "#create" do
    context "as an authenticated user" do
      before do
        @user = create(:user)
        @day = create(:day)
      end

      pending "adds a post" do
        # TODO: this example is something wrong. improve later
        post_params = attributes_for(:post)
        post_params[:user_id] = @user.id
        post_params[:day_id] = @day.id
        sign_in @user
        expect {
          post "/posts/create", params: { post: post_params }
        }.to change(@user.posts, :count).by(1)
      end
    end

    context "as a guest" do
      it "redirect to root" do
        post "/posts/create"
        expect(response).to redirect_to root_path
      end
    end
  end
end
