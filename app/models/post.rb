class Post < ApplicationRecord
  include Attachable
  acts_as_paranoid
  
  belongs_to :posted_by, class_name: "User", foreign_key: "owner_id"
  has_many :comments
end
