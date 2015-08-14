class SyncSerializer < ActiveModel::Serializer
  attribute :location_sync, key: :locations
  attribute :animal_sync, key: :animals

  def locations
    s = LocationSyncSerializer.new(object.location_sync)
    ActiveModel::Serializer::Adapter::FlattenJson.new(s).as_json
  end

  def animals
    s = AnimalSyncSerializer.new(object.animal_sync)
    ActiveModel::Serializer::Adapter::FlattenJson.new(s).as_json
  end
end
