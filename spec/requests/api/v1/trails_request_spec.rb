require 'rails_helper'

RSpec.describe 'trails request call' do
  it 'can return a list of nearby hiking trails and their associated attributes based on a queried location' do
    get '/api/v1/trails?location=denver,co'

    expect(response).to be_successful
    expect(response.content_type).to include('application/json')

    data = JSON.parse(response.body, symbolize_names: true)

  end

end

# Create a branch off of your Sweater Weather project called final_assessment.
# As you work, you should commit to this branch every 15 minutes.
# DO NOT push your code to your GitHub repo until the end of the 3 hour assessment
# Complete the user story below. You should:
# TDD all of your work
# Prioritize getting your code functional before attempting any refactors
# Write/refactor your code to achieve good code quality
# Assignment
# You will build an endpoint that will retrieve the forecast for a location and nearby trails with the distance to each trail.
# Your endpoint should follow this format:
# Your API will return:
# current temperature and conditions for the start location
# name of the trail
# summary of each trail
# difficulty of each trail
# location of each trail
# estimated distance to each trail
# Your response should be in the format below:
#
# {
#   "data": {
#     "id": "null",
#     "type": "trail",
#     "attributes": {
#       "location": "denver,co",
#       "forecast": {
#         "summary": "Cloudy with a chance of meatballs",
#         "temperature": "83"
#       },
#       "trails": [
#         {
#           "name": "Boulder Skyline Traverse",
#           "summary": "The classic long mountain route in Boulder."
#           "difficulty": "black"
#           "location": "Superior, Colorado"
#           "distance_to_trail": "23.008"
#         },
#         {
#           "name": "Bear Peak Out and Back",
#           "summary": "A must-do hike for Boulder locals and visitors alike!"
#           "difficulty": "black"
#           "location": "Boulder, Colorado"
#           "distance_to_trail": "30.098"
#         },
#         {...}
#       ]
#     }
#   }
# }
