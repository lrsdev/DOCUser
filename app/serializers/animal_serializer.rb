class AnimalSerializer < ActiveModel::Serializer
  attributes :id, :name, :blurb, :guidelines, :ext_url
end
