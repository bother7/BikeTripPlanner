class StationSerializer < ActiveModel::Serializer
  attributes :stop_id, :lat, :lon, :name, :id, :trains, :line

  def trains
    if object.trains.size != 0
      "#{object.trains[0].trip_id}"
    else
      ""
    end
  end

end
