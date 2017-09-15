class TrainSerializer < ActiveModel::Serializer
  attributes :id, :trip_id, :route, :direction, :delay, :currentlocation, :history

  def history
    if object.trainatstations.where({time: (Time.now - 10.minutes)..(Time.now + 10.minutes)}).size != 0
      array = object.trainatstations.where({time: (Time.now - 10.minutes)..(Time.now + 10.minutes)})
      x = array.map do |trainatstation|
        "<li>#{trainatstation.time.localtime("-04:00").strftime("%H:%M:%S")} - #{trainatstation.station.name}</li>"
      end.join("")
    else
      x =""
    end
    x
  end

  def currentlocation
    origincheck = 0
    destcheck = 0
    if object.trainatstations.where({time: (Time.now - 10.minutes)..(Time.now)}).size != 0
      origin = {lat: object.trainatstations.where({time: (Time.now - 10.minutes)..(Time.now)}).order(time: :desc).limit(1)[0].station.lat, lon: object.trainatstations.where({time: (Time.now - 10.minutes)..(Time.now)}).order(time: :desc).limit(1)[0].station.lon}
      origincheck = 1
    end
    if object.trainatstations.where({time: (Time.now)..(Time.now + 10.minutes)}).size != 0
      destination = {lat: object.trainatstations.where({time: (Time.now)..(Time.now + 10.minutes)}).order(time: :asc).limit(1)[0].station.lat, lon: object.trainatstations.where({time: (Time.now)..(Time.now + 10.minutes)}).order(time: :asc).limit(1)[0].station.lon}
      destcheck = 1
    end
    if origincheck == 1 && destcheck == 1
      lat1 = origin[:lat].to_f * Math::PI / 180
      lat2 = destination[:lat].to_f * Math::PI / 180
      lon1 = origin[:lon].to_f * Math::PI / 180
      lon2 = destination[:lon].to_f * Math::PI / 180
      bx = Math.cos(lat2) * Math.cos(lon2-lon1);
      by = Math.cos(lat2) * Math.sin(lon2-lon1);
      latMid = Math.atan2(Math.sin(lat1) + Math.sin(lat2),
               Math.sqrt( (Math.cos(lat1)+bx)*(Math.cos(lat1)+bx) + by*by ) )
               lonMid = lon1 + Math.atan2(by, Math.cos(lat1) + bx);
      latMid = latMid * 180 / Math::PI
      lonMid = lonMid * 180 / Math::PI
      x = "#{latMid},#{lonMid}"
    elsif origincheck == 0 && destcheck == 1
      x = "#{destination[:lat]},#{destination[:lon]}"
    elsif origincheck == 1 && destcheck == 0
      x = "#{origin[:lat]},#{origin[:lon]}"
    else
      x = "inactive"
    end
    x
  end


end
