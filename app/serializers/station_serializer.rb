class StationSerializer < ActiveModel::Serializer
  attributes :stop_id, :lat, :lon, :name

end
