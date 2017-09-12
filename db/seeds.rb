Trip.create([
  {origin: "zalis house", destination: "flatiron"},
  {origin: "joes house", destination: "america"},
  ])

  require 'csv'

  csv_text = File.read('app/models/stops.csv')
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    Station.create!(row.to_hash)
  end
