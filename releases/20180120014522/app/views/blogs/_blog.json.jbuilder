json.extract! blog, :id, :title, :des, :pic, :tags, :created_at, :updated_at
json.url blog_url(blog, format: :json)
