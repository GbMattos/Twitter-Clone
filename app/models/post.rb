class Post < ApplicationRecord
  include WillPaginate::ActiveRecord

  belongs_to :user

  validates :body, presence: true, length: { maximum: 280 }
end
