module Foursquare
  class User < Foursquare::Node
    #General
    def search(params={})
      params = {:phone => "",
                :email => "",
                :twitter => "",
                :twitterSource => "",
                :fbid => "",
                :name => ""}.merge!(params)

      self.class.perform_graph_request("users/search", params.merge(:oauth_token => @access_token))
    end

    def requests
      self.class.perform_graph_request("users/requests", {}.merge(:oauth_token => @access_token))
    end

    #Aspects
    def badges(user_id)
      self.class.perform_graph_request("users/#{user_id}/badges", {}.merge(:oauth_token => @access_token))
    end

    def checkins(user_id="self", params={})
      params = {:limit => 100,
                :offset => 0,
                :afterTimestamp => "",
                :beforeTimestamp => ""}.merge!(params)

      self.class.perform_graph_request("users/#{user_id}/checkins", params.merge(:oauth_token => @access_token))
    end

    def friends(user_id="self")
      self.class.perform_graph_request("users/#{user_id}/friends", params.merge(:oauth_token => @access_token))
    end

    def tips(user_id="self", params={})
      params = {:sort => "recent",
                :ll => "37.792694,-122.409325"}.merge!(params)

      self.class.perform_graph_request("users/#{user_id}/tips", params.merge(:oauth_token => @access_token))
    end

    def todos(user_id="self", params={})
      params = {:sort => "recent",
                :ll => "37.792694,-122.409325"}.merge!(params)

      self.class.perform_graph_request("users/#{user_id}/todos", params.merge(:oauth_token => @access_token))
    end

    def venuehistory(user_id="self")
      self.class.perform_graph_request("users/#{user_id}/venuehistory", params.merge(:oauth_token => @access_token))
    end

    #Actions
    def request(user_id)
      self.class.perform_graph_request("users/#{user_id}/request", {}.merge(:oauth_token => @access_token), "post")
    end

    def unfriend(user_id)
      self.class.perform_graph_request("users/#{user_id}/unfriend", {}.merge(:oauth_token => @access_token), "post")
    end

    def approve(user_id)
      self.class.perform_graph_request("users/#{user_id}/approve", {}.merge(:oauth_token => @access_token), "post")
    end

    def deny(user_id)
      self.class.perform_graph_request("users/#{user_id}/deny", {}.merge(:oauth_token => @access_token), "post")
    end

    def setpings(user_id, params={})
      params = {:value => "true"}.merge!(params)
      
      self.class.perform_graph_request("users/#{user_id}/setpings", params.merge(:oauth_token => @access_token), "post")
    end
  end
end
