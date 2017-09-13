class Updatetrain < ApplicationRecord

require 'protobuf'
require 'google/transit/gtfs-realtime.pb'
require 'net/http'
require 'byebug'

def self.query(route)
    data = Net::HTTP.get(URI.parse("http://datamine.mta.info/mta_esi.php?key=&feed_id=1"))
    feed = Transit_realtime::FeedMessage.decode(data)
    selectedtrainline = []
    for trainthing in feed.entity do
      if trainthing.try(:trip_update).try(:trip).try(:route_id) == route || trainthing.vehicle.try(:trip).try(:route_id) == route
        selectedtrainline << trainthing
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
    southbound.map do |train|
      trainid = train.trip_update.trip.trip_id
      findtrain = Train.find_or_create_by({trip_id: trainid, route: route})
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
    # trainids = southbound.map {|train| train.trip_update.trip.trip_id}
    # northbound.each {|train| trainids << train.trip_update.trip.trip_id}
    # trainids.each do |train|
    #   Train.find_or_create_by({trip_id: train, route: route})
    # end
    # byebug
  end
end
