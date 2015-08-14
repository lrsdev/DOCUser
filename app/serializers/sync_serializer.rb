class SyncSerializer < ActiveModel::Serializer

  attributes :new, :updated, :updated_image, :deleted, :synced_at

  def updated
    serialize(object.updated)
  end

  def new
    serialize(object.new)
  end

  def updated_image
    serialize(object.updated_image)
  end

  # Serialize location collections
  def serialize(l)
    # Pieced together from source code and github issues
    s = ActiveModel::Serializer::ArraySerializer.new(l, serializer: LocationSerializer)
    # Application uses Json adapter by default, find a way to use adapter controllers are using
    ActiveModel::Serializer::Adapter::Json.new(s).as_json
  end
end
