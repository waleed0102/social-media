class UserSerializer < ActiveModel::Serializer
  attributes :email, :name, :profile_picture_url
end
