class PostsController < ApplicationController
  
  # index
  def index
    @posts = Post.all
  end
  
  # /posts/new
  def new
    @post = Post.new 
  end  
  
  # create
  def create
    @post = Post.new(params[:post])
    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path, notice: 'successfully created post'}
      else
        format.html {render action: 'new'}
      end
    end
  end
  
  #edit
  def edit
    @post = Post.find(params[:id])
  end
  
  #update
  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html {redirect_to root_path, notice: 'successfully updated post'}
      else
        format.html {render action: 'new'}
      end  
    end
  end
end
