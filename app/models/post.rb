class Post < ApplicationRecord
  include WillPaginate::ActiveRecord

  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :body, presence: true, length: { maximum: 280 }
end
