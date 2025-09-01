class Comment < ApplicationRecord
  belongs_to :article
  validates :username, presence: true
  validates :body, presence: true
end
