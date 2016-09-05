class FeatureRequest < ApplicationRecord
  belongs_to :client
  belongs_to :product_area

  has_many :comments, as: :commentable

  after_save :sum_gte_priorities

  validates_numericality_of :client_priority, greater_than_or_equal_to: 1
  validates :ticket_url, :format => URI::regexp(%w(http https))

  accepts_nested_attributes_for :comments, allow_destroy: true

  def sum_gte_priorities
    current = self
    while current = current.same_priority_request
      current.update client_priority: client_priority + 1
    end
    true
  end

  def siblings
    client&.feature_requests&.where('id != ?', id)
  end

  def same_priority_request
    siblings.find_by client_priority: client_priority
  end

  def comments!
    Comment.for_request(self).includes(:user)
  end
end
