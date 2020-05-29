require 'sinatra'
require 'shotgun'
require 'date'

set :session_secret, 'super secret'

get "/" do
  erb (:index)
end

post "/birthday" do
  @name = params[:name]
  @birthday = Date.new(Date.today.year, params[:month].to_i, params[:day].to_i)
  @birthday_today = @birthday == Date.today
  @birthday = Date.new((Date.today.year) + 1, params[:month].to_i, params[:day].to_i) if Date.today > @birthday
  @countdown = (@birthday - Date.today).to_i
  erb (:birthday)
end
