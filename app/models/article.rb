class Article < ApplicationRecord
  include Visible
  # relationship
  has_many :comments, dependent: :destroy
  
  # validates
  VALID_STATUSES = ['public', 'private', 'archived']

  validates :title, presence: true ,begin_with_ruby: true
  validates :body, presence: true, length: { minimum: 10 }
  validates :status, inclusion: { in: VALID_STATUSES }

end
