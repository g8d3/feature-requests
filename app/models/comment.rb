class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  sync :all
  sync_scope :for_request, ->(commentable){ where commentable: commentable }
end
