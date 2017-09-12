require 'protobuf'
require 'google/transit/gtfs-realtime.pb'
require 'net/http'
require 'byebug'


data = Net::HTTP.get(URI.parse("http://datamine.mta.info/mta_esi.php?key=&feed_id=1"))
feed = Transit_realtime::FeedMessage.decode(data)
fourtrains = []
for trainthing in feed.entity do
  if trainthing.try(:trip_update).try(:trip).try(:route_id) == "4" || trainthing.vehicle.try(:trip).try(:route_id) == "4"
    fourtrains << trainthing
  end
end
northbound = []
for singletrain in fourtrains do
    if singletrain.respond_to?(:trip)
      if singletrain.trip.trip_id.split("..")[1][0]  == "N"
        northbound << singletrain
      end
    elsif singletrain.respond_to?(:trip_update) && singletrain.trip_update.respond_to?(:trip)
      if singletrain.trip_update.trip.trip_id.split("..")[1][0] == "N"
        northbound << singletrain
      end
    else
      if singletrain.vehicle.trip.trip_id.split("..")[1][0] == "N"
        northbound << singletrain
      end
    end
end
southbound = fourtrains.select {|train| !northbound.include?(train)}

byebug
sd
