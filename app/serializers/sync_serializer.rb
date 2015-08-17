class SyncSerializer < ActiveModel::Serializer
  attribute :locations
  attribute :animals
  attribute :synced_at
  attribute :location_ids
  attribute :animal_ids

  def locations
    s = ActiveModel::Serializer::ArraySerializer.new(object.locations, serializer: LocationSerializer)
    ActiveModel::Serializer::Adapter::FlattenJson.new(s).as_json
  end

  def animals
    s = ActiveModel::Serializer::ArraySerializer.new(object.animals, serializer: AnimalSerializer)
    ActiveModel::Serializer::Adapter::FlattenJson.new(s).as_json
  end

  def location_ids
    ids = []
    object.locations.each { |l|
      ids << l.id }
    ids
  end

  def animal_ids
    ids = []
    object.animals.each { |a|
      ids << a.id }
    ids
  end
end
