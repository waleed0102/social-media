class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :media_url
  belongs_to :post
end
