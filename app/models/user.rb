class User < ApplicationRecord
  # Include default devise modules.
  extend Devise::Models

  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :posts, foreign_key: "owner_id"
  has_many :comments, foreign_key: "owner_id"

  has_one_attached :profile_picture

  validate :acceptable_image

  def acceptable_image
    return unless profile_picture.attached?

    unless profile_picture.byte_size <= 10.megabyte
      errors.add(:profile_picture, "is too big")
    end

    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(profile_picture.content_type)
      errors.add(:profile_picture, "must be a JPEG or PNG")
    end
  end

  def profile_picture_url
    Rails.application.routes.url_helpers.rails_blob_url(self, host: "localhost:3000")
  end
end
