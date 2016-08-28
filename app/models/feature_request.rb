class FeatureRequest < ApplicationRecord
  belongs_to :client

  after_save :sum_gte_priorities

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
end
