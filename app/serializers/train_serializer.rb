class TrainSerializer < ActiveModel::Serializer
  attributes :id, :trip_id, :route, :direction, :delay, :currentlocation

  def currentlocation
    # if object.trainatstations.where({time: (Time.now - 5.minutes)..(Time.now + 5.minutes)}).size != 0
    #   "origin #{object.trainatstations.where({time: (Time.now - 5.minutes)..(Time.now)}).order(time: :desc).limit(1)[0].station.name} destination: #{object.trainatstations.where({time: (Time.now)..(Time.now + 5.minutes)}).order(time: :desc).limit(1)[0].station.name}"
    # else
    #   ""
    # end
  end

end
