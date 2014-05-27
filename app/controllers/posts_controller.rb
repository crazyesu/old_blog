class PostsController < ApplicationController
  http_basic_authenticate_with :name => "aaa", :password => "9999", :except => [:index, :show]



  def index
    @posts = Post.all

    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @posts }
    end
  end



  def new
    @post = Post.new
    respond_to do |format|
      format.html  # new.html.haml
      format.json  { render :json => @post }
    end
  end



  def create
    @post = Post.new(params[:post])
    respond_to do |format|
      if @post.save
        format.html  { redirect_to(@post,
                      :notice => 'Post was successfully created.') }
        format.json  { render :json => @post,
                      :status => :created, :location => @post }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @post.errors,
                      :status => :unprocessable_entity }
      end
    end
  end



  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html  # new.html.haml
      format.json  { render :json => @post }
    end
 # 		p 'DEBUG'*100
 # 		p @post.inspect
  end


 # 		def post_params
 #  		params.require(:post).permit(:title, :text)
 #		end



  def edit
    @post = Post.find(params[:id])
  end



  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html  { redirect_to(post_path,
                      :notice => 'Post was successfully updated.') }
        format.json  { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @post.errors,
                      :status => :unprocessable_entity }
      end
    end
  end



  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do|format|
      format.html { redirect_to(posts_path) }
      format.json {head :ok}
    end
  end


end