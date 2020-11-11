# README

## Setup
1. git clone git@github.com:sarynm12/sweater-weather.git
2. cd sweater_weather
3. bundle install
4. rails db{create,migrate}
5. Add your own API keys to the application.yml file (OPEN_WEATHER_API_KEY, UNSPLASH_API_KEY, MAPQUEST_API_KEY)
6. bundle exec rspec to run the test suite

## APIs Utilized
- [Unsplash](https://api.unsplash.com/)<br>
- [MapQuest](http://www.mapquestapi.com)<br>
- [Open Weather Map](https://api.openweathermap.org)

## Ruby/Rails Version
Ruby 2.5.3 Rails 5.2.4
