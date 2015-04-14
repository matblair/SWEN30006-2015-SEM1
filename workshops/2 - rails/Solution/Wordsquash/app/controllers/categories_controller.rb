class CategoriesController < ApplicationController
  before_action :find_category, only: [:posts_after_date, :show]

  def posts_after_date
    # Find the date
    date_string = params[:date]
    d = Date.parse(date_string)
    puts d

    if d
      # Now that we have a category, build the json response.
      posts = {}
      valid = @cat.posts.select {|p| p.created_at >= d}
      valid.each do |p|
        posts[p.id] = p.attributes
      end
      cat_json = {"id" => @cat.id, "title" => @cat.title, "description" => @cat.description, 'posts' => posts}
      render json: cat_json.to_json
    else
      render json: {:error => "No DATE provided"}.to_json
    end
  end

  def index
    cats = {}
    Category.all.each do |c|
      cats[c.id] = c.attributes
      cats[c.id][:post_count]=c.posts.count
    end
    render json: cats.to_json
  end

  def show
    posts = {}
    @cat.posts.each do |p|
      posts[p.id] = p.attributes
    end
    cat_json = {"id" => @cat.id, "title" => @cat.title,
                "description" => @cat.description,
                'posts' => posts}

    render json: cat_json.to_json
  end

  private

  def find_category
    if params[:id]
      @cat = Category.find(params[:id].to_i)
    else
      render json: {:error => "No Category id provided"}.to_json
    end
  end
end
