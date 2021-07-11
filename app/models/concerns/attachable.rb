module Attachable
  extend ActiveSupport::Concern

  included do
    has_one_attached :media

    validate :acceptable_media
    validates :content, presence: { message: "OR media is mandatory" }, unless: :media
    validates :media, presence: { message: "OR content is mandatory" }, unless: :content
  end

  def acceptable_media
    return unless media.attached?

    unless media.byte_size <= 100.megabyte
      errors.add(:media, "is too big")
    end
  end

  def media_url
    Rails.application.routes.url_helpers.rails_blob_url(self.media, host: "localhost:3000") if self.media.attached?
  end
end