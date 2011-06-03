module Foursquare
  class Settings < Foursquare::Node
    #General
    def all
      self.class.perform_graph_request("settings/all", {}.merge(:oauth_token => @access_token))
    end

    #Actions
    def set(setting_id, params={})
      # setting_id can be  sendToTwitter, sendToFacebook, receivePings
      params = {:valueId => ""}.merge!(params)

      self.class.perform_graph_request("settings/#{setting_id}/set", params.merge(:oauth_token => @access_token), "post")
    end
  end
end
