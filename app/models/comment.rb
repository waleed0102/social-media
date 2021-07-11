class Comment < ApplicationRecord
  acts_as_paranoid
  include Attachable

  belongs_to :commented_by, class_name: "User", foreign_key: "owner_id"
  belongs_to :post
end
