class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :published_at, :published
end
