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
		sortedArray = sorttimes(dataArray)
		datajson = sortedArray.to_json
		return datajson
	end

	def sorttimes(dataArray)
		sortedArray = []
		minHash = {}
		dataArray.each do |x|
			min = x["time"].split("-")[0].to_i
			if minHash[min] == nil
				minHash[min] = []
			end
			minHash[min].push(x)
		end
		minHash.each do |key, value|
			sortedvalue = value.sort_by { |k| k["time"].split("-")[2].to_f }
			minHash[key] = sortedvalue
		end
		j=0
		while j < 10
			if minHash[j] != nil
				sortedArray.push(*minHash[j])

			end
			j+=1
		end
		binding.pry
		return sortedArray
	end

	def savetimestoCSV(params)
		File.open('savedtimes.csv', 'a') do |file|
					file << params["name"] + "," + params["time"] + "\n"
		end
	end

end