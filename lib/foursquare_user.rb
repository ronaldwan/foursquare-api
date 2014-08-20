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

      perform_graph_request("users/search", params)
    end

    def requests
      perform_graph_request("users/requests", {})
    end

    #Aspects
    def badges(user_id)
      perform_graph_request("users/#{user_id}/badges", {})
    end

    def checkins(user_id="self", params={})
      params = {:limit => 100,
                :offset => 0,
                :afterTimestamp => "",
                :beforeTimestamp => ""}.merge!(params)

      perform_graph_request("users/#{user_id}/checkins", params)
    end

    def friends(user_id="self")
      perform_graph_request("users/#{user_id}/friends", params)
    end

    def tips(user_id="self", params={})
      params = {:sort => "recent",
                :ll => "37.792694,-122.409325"}.merge!(params)

      perform_graph_request("users/#{user_id}/tips", params)
    end

    def todos(user_id="self", params={})
      params = {:sort => "recent",
                :ll => "37.792694,-122.409325"}.merge!(params)

      perform_graph_request("users/#{user_id}/todos", params)
    end

    def venuehistory(user_id="self")
      perform_graph_request("users/#{user_id}/venuehistory", params)
    end

    #Actions
    def request(user_id)
      perform_graph_request("users/#{user_id}/request", {}, "post")
    end

    def unfriend(user_id)
      perform_graph_request("users/#{user_id}/unfriend", {}, "post")
    end

    def approve(user_id)
      perform_graph_request("users/#{user_id}/approve", {}, "post")
    end

    def deny(user_id)
      perform_graph_request("users/#{user_id}/deny", {}, "post")
    end

    def setpings(user_id, params={})
      params = {:value => "true"}.merge!(params)
      
      perform_graph_request("users/#{user_id}/setpings", params, "post")
    end
  end
end
