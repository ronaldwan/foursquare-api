module Foursquare
  class Photo < Foursquare::Node
    def add(params={}, file="")
      require 'rest_client'

      params = {:checkinId => "",
                :tipId => "",
                :venueId => "",
                :broadcast => "",
                :ll => "",
                :llAcc => "",
                :alt => "",
                :altAcc => "",
                :file => File.new(file)}

      RestClient.post('https://api.foursquare.com/v2/photos/add', params)
    end
  end
end