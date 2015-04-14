class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :author
  belongs_to :anthology

  def to_json
  	author_details = {'id' => author.id, 'name' => author.name,
  					  'dob' => author.dob, 'website' => author.url}
  	category_details = {'id' => category.id, 'title' => category.title,
  					    'description' => category.description}
  	post_details = {'id' => id, 'title' => title,
  					'body' => body, 'category' => category_details,
  					'author' => author_details, 'img' => img_url}
  	post_details.to_json
  end

end
