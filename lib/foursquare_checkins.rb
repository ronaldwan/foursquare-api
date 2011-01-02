module Foursquare
  class Checkins < Foursquare::Node
    #General
    def add(params={})
      params = {:venueId    => "",
                :venue      => "",
                :shout      => "",
                :broadcast  => "public",
                :ll         => "37.792694,-122.409325",
                :llAcc      => "100",
                :alt        => "0",
                :altAcc     => "100"}.merge!(params)

      perform_graph_request("checkins/add", params, "post")
    end

    def recent(params={})
      params = {:ll                 => "37.792694,-122.409325", #for returning each venue's distance from ll
                :limit              => "100",
                :offset             => "0",
                :afterTimestampAcc  => ""}.merge!(params)

      perform_graph_request("checkins/recent", params)
    end

    #Actions
    def addcomment(checkin_id, params={})
      params = {:ll   => "37.792694,-122.409325", #for returning each venue's distance from ;;
                :text => "100"}.merge!(params)

      perform_graph_request("checkins/#{checkin_id}/addcomment", params, "post")
    end

    def deletecomment(checkin_id, params={})
      params = {:commentId  => ""}.merge!(params)

      perform_graph_request("checkins/#{checkin_id}/deletecomment", params, "post")
    end
  end
end