class Post < ActiveRecord::Base
  belongs_to :user
  has_many :replies

  validates :title, presence: true
  validates :content, presence: true

end
