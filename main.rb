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

get("/returnresult") {
	session[:result]
	binding.pry
}

get("/getsaved") {
	times.savedtimesToJSON()
}


post("/check"){
	session[:result]= coordinates.checkcoordinates(params)
	redirect('/returnresult')
}

post("/savetime"){
	times.savetimestoCSV(params)
	redirect('/index')
}