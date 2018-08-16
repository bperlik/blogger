require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  let(:my_post) { Post.create!(title: "New Post Title", body: "New Post Body")}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_post] to @posts" do
      get :index
      expect(assigns(:posts)).to eq([my_post])
    end
  end

  describe "GET #new" do
    # post returns 200
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    # post new template view appears
    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    # post is not nil
    it "instantiates @post" do
      get :new
      expect(assigns(:post)).not_to be_nil
    end
  end

end


