class Updatetrain < ApplicationRecord

require 'protobuf'
require 'google/transit/gtfs-realtime.pb'
require 'net/http'
require 'byebug'

def self.query()
    data = Net::HTTP.get(URI.parse("http://datamine.mta.info/mta_esi.php?key=261575ac00353ab9c3bbe46c115b1c52&feed_id=1"))
    feed = Transit_realtime::FeedMessage.decode(data)
    routearray = ["1","2","3","4","5","6"]
    for route in routearray do
      selectedtrainline = []
      currentvehiclestatus = []
      for trainthing in feed.entity do
        if trainthing.try(:trip_update).try(:trip).try(:route_id) == route
          selectedtrainline << trainthing
        elsif trainthing.try(:vehicle).try(:trip).try(:route_id) == route
          currentvehiclestatus << trainthing
        end
      end
      northbound = []
      southbound = []
      for singletrain in selectedtrainline do
          if singletrain.respond_to?(:trip_update) && singletrain.trip_update.respond_to?(:trip)
            if singletrain.trip_update.trip.trip_id.split("..")[1][0] == "N"
              northbound << singletrain
            elsif
              if singletrain.trip_update.trip.trip_id.split("..")[1][0] == "S"
                southbound << singletrain
              end
            end
          end
        end
        Updatetrain.createtrainatstations(southbound, "S", route)
        Updatetrain.createtrainatstations(northbound, "N", route)
      end
  end

def self.createtrainatstations(direction, str, route)
  direction.map do |train|
    trainid = train.trip_update.trip.trip_id
    findtrain = Train.find_or_create_by({trip_id: trainid, route: route, direction: str})
    train.trip_update.stop_time_update.each do |timeupdate|
      findstation = Station.find_by({stop_id: timeupdate.stop_id.to_i.to_s})
      if timeupdate.arrival.respond_to?(:time)
        esttime = timeupdate.arrival.time
        trainatstation = Trainatstation.find_or_create_by({train: findtrain, station:findstation})
        trainatstation.time = Time.at(esttime)
        trainatstation.save
      end
    end
  end
end



end
