class CoordinatesCSV

	def checkcoordinates(params)
		correct = []
		CSV.foreach('waldocoordinates.csv') do |row|
			correct = row
		end
		xcoord = correct[0].to_f
		ycoord = correct[1].to_f
		if params["valueX"].to_f.between?(xcoord - (xcoord*0.02), xcoord + (xcoord*0.02))
			if params["valueY"].to_f.between?(ycoord - (ycoord*0.1), ycoord + (ycoord*0.1))
				guess = "true"
			else
				guess = "false"
			end
		else
			guess = "false"
		end
		return guess
	end

end

class SavedTimes

	def savedtimesToJSON
		dataArray = []
		CSV.foreach("savedtimes.csv") do |row|
			dataArray.push({"time" => row[1], "name" => row[0]})
		end
		datajson = dataArray.to_json
		return datajson
	end

	def savetimestoCSV(params)
		File.open('savedtimes.csv', 'a') do |file|
					file << params["name"] + "," + params["time"] + "\n"
		end
	end

end