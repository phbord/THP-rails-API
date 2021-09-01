class Article < ApplicationRecord

  include Rails.application.routes.url_helpers

  belongs_to :user
  has_many :comments

  has_one_attached :image

  validates :title, presence: true
  validates :content, presence: true

  def get_image_url
    url_for(self.image)
  end
end
