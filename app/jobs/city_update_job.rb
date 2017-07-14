class CityUpdateJob < ApplicationJob
  queue_as :default
  after_perform do |job|
    self.class.set(wait: 1.minute).perform_later
  end

  @@BASE_URL = 'http://api.openweathermap.org/data/2.5/box/city?bbox='
  @@API_KEY = ',180,1000&appid=ae1ff8ec7a4faaabf1ef775f5a4957b2&units=imperial'
  @@ZONE_ARR = [
    "#{@@BASE_URL}-180,-180,-87#{@@API_KEY}",
    "#{@@BASE_URL}-87,-180,-70#{@@API_KEY}",
    "#{@@BASE_URL}-70,-180,-5#{@@API_KEY}",
    "#{@@BASE_URL}-5,-180,5#{@@API_KEY}",
    "#{@@BASE_URL}5,-180,13#{@@API_KEY}",
    "#{@@BASE_URL}13,-180,30#{@@API_KEY}",
    "#{@@BASE_URL}30,-180,50#{@@API_KEY}",
    "#{@@BASE_URL}50,-180,78#{@@API_KEY}",
    "#{@@BASE_URL}78,-180,110#{@@API_KEY}",
    "#{@@BASE_URL}110,-180,180#{@@API_KEY}"
  ]
  @@counter = 0

  def cities_data_update
    update_cities = HTTParty.get(@@ZONE_ARR[@@counter])['list']
    sleep(10)
    update_cities.each do |city|
      record = City.find_by_owm_id(city['id'])
      record.update(
        temp: city['main']['temp'],
        wind_speed: city['wind']['speed'],
        wind_deg: city['wind']['deg'],
        weather: city['weather'][0]['main'],
        weather_description: city['weather'][0]['description'],
        weather_icon: city['weather'][0]['icon'],
        time: Time.at(city['dt']).strftime('%l:%M %p %Z')
      )
    end
    @@counter = (@@counter + 1) % 9
  end

  def perform(*args)
    self.cities_data_update
  end
end
