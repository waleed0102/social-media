class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :media_url
  has_many :comments
end
