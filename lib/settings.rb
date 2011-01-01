module Foursquare
  class Settings < Node
    #General
    def all
      perform_graph_request("settings/all", {})
    end

    #Actions
    def set(setting_id, params={})
      # setting_id can be  sendToTwitter, sendToFacebook, receivePings
      params = {:valueId => ""}.merge!(params)

      perform_graph_request("settings/#{setting_id}/set", params, "post")
    end
  end
end