module Foursquare
  class Node
    def initialize(origin_identifier, access_token="")
      @origin_identifier  = origin_identifier
      @access_token       = access_token
      @base_url = "https://api.foursquare.com:443/v2/"
    end

    def perform_graph_request(endpoint, params={}, method="get")
      require 'net/http'

      @query_string = "?"
      @query_string += "oauth_token=#{CGI.escape(@access_token)}" unless @access_token.blank?

      if method=="get"
        params.each{|key, val| @query_string += "&#{key}=#{val}"}
        url = URI.parse("#{@base_url}#{endpoint}#{@query_string}")
        request = Net::HTTP::Get.new("#{url.path}?#{url.query}",{"Content-Type"=>"text/json"})
      else
        url = URI.parse("#{@base_url}#{endpoint}#{@query_string}")
        request = Net::HTTP::Post.new("#{url.path}?#{url.query}",{"Content-Type"=>"text/json"})
        request.set_form_data(params)
      end

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      response = JSON.parse(http.start {|http| http.request(request) }.body)
      response
    end
  end
end
