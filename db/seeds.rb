Trip.create([
  {origin: "zalis house", destination: "flatiron"},
  {origin: "joes house", destination: "america"},
  ])

  require 'csv'

  csv_text = File.read('db/stops.csv')
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    Station.create!(row.to_hash)
  end

  secondcsv_text = File.read('db/stations_with_routes.csv')
  secondcsv = CSV.parse(secondcsv_text, :headers => true)
  secondcsv.each do |row|
    hash = row.to_hash
    station = Station.where("lon LIKE ?", "#{hash["LONGITUDE"]}%").where("lat LIKE ?", "#{hash["LATITUDE"]}%")[0]
    if !!station
      station.line = hash["LINE"]
      station.save
    end
  end
