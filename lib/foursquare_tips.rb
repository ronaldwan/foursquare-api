module Foursquare
  class Tips < Foursquare::Node
    #General
    def add(params={})
      params = {:venueId => "",
                :text => "",
                :url => ""}.merge!(params)

      self.class.perform_graph_request("tips/add", params.merge(:oauth_token => @access_token), "post")
    end

    def search(params={})
      params = {:ll => "37.792694,-122.409325",
                :limit => "100",
                :offset => "0",
                :filter => "",
                :query => ""}.merge!(params)

      self.class.perform_graph_request("tips/search", params.merge(:oauth_token => @access_token))
    end

    #Actions
    def marktodo(tip_id)
      self.class.perform_graph_request("tips/#{tip_id}/marktodo", {}.merge(:oauth_token => @access_token), "post")
    end

    def markdone(tip_id)
      self.class.perform_graph_request("tips/#{tip_id}/markdone", {}.merge(:oauth_token => @access_token), "post")
    end

    def unmark(tip_id)
      self.class.perform_graph_request("tips/#{tip_id}/unmark", {}.merge(:oauth_token => @access_token), "post")
    end
  end
end
