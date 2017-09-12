require 'protobuf'
require 'google/transit/gtfs-realtime.pb'
require 'net/http'
require 'byebug'


data = Net::HTTP.get(URI.parse("http://datamine.mta.info/mta_esi.php?key=&feed_id=1"))
feed = Transit_realtime::FeedMessage.decode(data)
updatearray = []
normalarray = []
for entity in feed.entity do
  if entity.field?(:trip_update)
    updatearray << entity.trip_update
  else
    normalarray << entity
  end
end
fourtrains = []
for trainthing in updatearray do
  if trainthing.trip.route_id == "4"
    fourtrains << trainthing
  end
end
for train in normalarray do
  if train.vehicle.try(:trip).try(:route_id) == "4"
    fourtrains << train
  end
end
northbound = []
for singletrain in fourtrains do
  # p singletrain
    if singletrain.respond_to?(:trip)
      if singletrain.try(:trip).try(:trip_id).split("..")[1][0]  == "N"
        northbound << singletrain
      end
    else
      if singletrain.vehicle.trip.trip_id.split("..")[1][0] == "N"
        northbound << singletrain
      end
    end
end
byebug
asdasda
