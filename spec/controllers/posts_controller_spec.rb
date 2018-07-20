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

  describe "POST create" do
    it "increases the number of Posts by one" do
      expect{post :create, post: {title: "Test title", body: "Test body"}}.to change(Post, :count).by(1)
    end

    # assigns the new post data to an instance of post
    it "assigns the new post to @post" do
      post :create, post: {title: "Test title", body: "Test body"}
      expect(assigns(:post)).to eq Post.last
    end

    # shows the new post after creating it
    it "redirects to the new post" do
      post :create, post: {title: "Test title", body: "Test body"}
      expect(response).to redirect_to Post.last
    end
  end

  describe "GET show" do
    # get id parameter, and passes to the params hash
    it "returns http success" do
      get :show, id: my_post.id
      expect(response).to have_http_status(:success)
    end

    # expect the show view to render using template
    it "renders the #show view" do
      get :show, id: my_post.id
      expect(response).to render_template :show
    end

    # expect the post asked for to be assigned to showed post
    it "assigns my_post to @post" do
      get :show, id: my_post.id
      expect(assigns(:post)).to eq(my_post)
    end
  end

end


