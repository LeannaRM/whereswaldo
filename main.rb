require 'sinatra'
require 'pry'
require 'csv'
require_relative "./functions.rb"
require 'json'
enable :sessions

coordinates = CoordinatesCSV.new
times = SavedTimes.new

get("/index") {
	erb :index
}

get("/getsaved") {
	return times.savedtimesToJSON()
}

get("/check"){
	return coordinates.checkcoordinates(params)
}

post("/savetime"){
	times.savetimestoCSV(params)
	return nil
}