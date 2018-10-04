class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
   # find the post with id in params that was passed to show method
   @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    # create an instance of post using params
    @post = Post.new
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]
    @post.user = current_user # whodat.current_user        # ADDED FOR USING ENGINE

    #if post is saved, flash saved message and redirect to the new post
    #if post is not saved, flash error msg and render new (form)
    if @post.save
      flash[:notice] = "Your post was saved."
      redirect_to @post
    else
      flash.now[:alert]="There was an error saving your post. Please try again."
      render :new
    end
  end

end
