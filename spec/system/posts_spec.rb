require 'rails_helper'

RSpec.describe "Posts", type: :system do
  before do
    driven_by(:rack_test)
  end

  context "as an authenticated user" do
    before do
      @user = create(:user)
      @day = create(:day)

      visit root_path
      click_link "Log In"
      fill_in "Email", with: @user.email
      fill_in "Password", with: @user.password
      click_button "commit"
    end

    it "create a new post" do
      expect {
        click_link "Post Happy"
        fill_in "content", with: "Today's happy"
        click_button "Post"

        expect(page).to have_content "Today's happy"
      }.to change(@user.posts, :count).by(1)
    end

    it "can't see any another user's post in index page" do
      another_user = create(:user)
      my_post = create(:post, user_id: @user.id, content: "my post")
      another_user_post = create(:post, user_id: another_user.id, content: "his post")

      visit posts_index_path
      expect(page).to have_content "my post"
      expect(page).to_not have_content "his post"
    end

    it "can't visit another user's post details" do
      another_user = create(:user)
      my_post = create(:post, user_id: @user.id, content: "my post")
      another_user_post = create(:post, user_id: another_user.id, content: "his post")

      visit "/posts/1"
      expect(page).to have_content "my post"

      visit "/posts/2"
      expect(page).to_not have_content "his post"
    end

    context "an author" do
      before do
        @another_user = create(:user)
        my_post1 = create(:post, user_id: @user.id, day_id: @day.id)
        my_post2 = create(:post, user_id: @user.id, day_id: @day.id)
        another_user_post = create(:post, user_id: @another_user.id, day_id: @day.id)
      end

      it "an author sees stars as count of posts on each day" do
        visit posts_index_path
        expect(all('.fas').size).to eq(2)
      end

      it "another user sees stars as count of their posts" do
        click_link "Log Out"
        visit root_path
        click_link "Log In"
        fill_in "Email", with: @another_user.email
        fill_in "Password", with: @another_user.password
        click_button "commit"

        visit posts_index_path
        expect(all('.fas').size).to eq(1)
      end
    end

  end
end
