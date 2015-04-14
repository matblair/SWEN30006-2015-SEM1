class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    respond_to do |format|
      format.html
      format.json { render json: index_json }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render json: @post.to_json }
    end
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    # puts params
    @post = Post.new(post_params)

    # Another method to do it
    # category = Category.find_by(title: params[:category_name])
    # if category
    #   @post.category = category
    # else
    #   c = Category.new
    #   c.title = params[:category_name]
    #   c.save!
    #   @post.category = c
    # end

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Create the hash for the index method
    def index_json
      posts = {}
      @posts.each do |p|
        posts[p.id] = p.attributes
      end
      posts.to_json
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :img_url, :category_id, :author_id, :anthology_id)
    end

end
