# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

base_url = 'http://api.openweathermap.org/data/2.5/box/city?bbox='
api_key = '&appid=ae1ff8ec7a4faaabf1ef775f5a4957b2&units=imperial'
zone1 = HTTParty.get "#{base_url}-180,-180,-87,180,1000#{api_key}"
zone2 = HTTParty.get "#{base_url}-87,-180,-70,180,1000#{api_key}"
zone3 = HTTParty.get "#{base_url}-70,-180,-5,180,1000#{api_key}"
zone4 = HTTParty.get "#{base_url}-5,-180,5,180,1000#{api_key}"
zone5 = HTTParty.get "#{base_url}5,-180,13,180,1000#{api_key}"
sleep(10)
zone6 = HTTParty.get "#{base_url}13,-180,30,180,1000#{api_key}"
zone7 = HTTParty.get "#{base_url}30,-180,50,180,1000#{api_key}"
zone8 = HTTParty.get "#{base_url}50,-180,78,180,1000#{api_key}"
zone9 = HTTParty.get "#{base_url}78,-180,110,180,1000#{api_key}"
zone10 = HTTParty.get "#{base_url}110,-180,180,180,1000#{api_key}"
sleep(10)
zone_arr = [zone1['list'], zone2['list'], zone3['list'], zone4['list'], zone5['list'], zone6['list'], zone7['list'], zone8['list'], zone9['list'], zone10['list']]


zone_arr.each do |zone|
  zone.each do |city|
    City.create(
      name: city['name'],
      owm_id: city['id'],
      lat: city['coord']['Lat'],
      lon: city['coord']['Lon'],
      temp: city['main']['temp'],
      wind_speed: city['wind']['speed'],
      wind_deg: city['wind']['deg'],
      weather: city['weather'][0]['main'],
      weather_description: city['weather'][0]['description'],
      weather_icon: city['weather'][0]['icon']
    )
  end
end
