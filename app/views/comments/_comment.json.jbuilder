json.extract! comment, :id, :commentable_type, :commentable_id, :user_id, :text, :created_at, :updated_at
json.url comment_url(comment, format: :json)