require 'sinatra'
require_relative 'sinatra_ssl'

set :port, 4567
set :ssl_certificate, File.expand_path("../cert.pem", __FILE__)
set :ssl_key, File.expand_path("../key.pem", __FILE__)

use Rack::Auth::Basic, "Restricted Area" do |username, password|
  username == 'username' and password == 'password'
end

get '/arm' do
  %x{ /home/pi/bin/security -a }
end

get '/disarm' do
  %x{ /home/pi/bin/security -d }
end

get '/status' do
  %x{ /home/pi/bin/security -s }
end
