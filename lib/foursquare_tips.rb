module Foursquare
  class Tips < Foursquare::Node
    #General
    def add(params={})
      params = {:venueId => "",
                :text => "",
                :url => ""}.merge!(params)

      perform_graph_request("tips/add", params, "post")
    end

    def search(params={})
      params = {:ll => "37.792694,-122.409325",
                :limit => "100",
                :offset => "0",
                :filter => "",
                :query => ""}.merge!(params)

      perform_graph_request("tips/search", params)
    end

    #Actions
    def marktodo(tip_id)
      perform_graph_request("tips/#{tip_id}/marktodo", {}, "post")
    end

    def markdone(tip_id)
      perform_graph_request("tips/#{tip_id}/markdone", {}, "post")
    end

    def unmark(tip_id)
      perform_graph_request("tips/#{tip_id}/unmark", {}, "post")
    end
  end
end
