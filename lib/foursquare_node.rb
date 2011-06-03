module Foursquare
  class Node
    def initialize(access_token)
      @access_token       = access_token
    end

    BASE_URL = "https://api.foursquare.com:443/v2/"

    def self.perform_graph_request(endpoint, params={}, method="get")
      require 'net/http'

      query_string = "?"
      if params[:oauth_token]
        query_string += "oauth_token=#{params[:oauth_token]}"
      elsif params[:client_id] && params[:client_secret]
        query_string += "client_id=#{params[:client_id]}&client_secret=#{params[:client_secret]}"
      else
        raise "client_id and client_secret or oauth_token are required."
      end
      params.reject! {|k,v| [:oauth_token, :client_secret, :client_id].include?(k) }

      if method=="get"
        params.each{|key, val| query_string += "&#{key}=#{val}"}
        url = URI.parse("#{BASE_URL}#{endpoint}#{query_string}")
        request = Net::HTTP::Get.new("#{url.path}?#{url.query}",{"Content-Type"=>"text/json"})
      else
        url = URI.parse("#{BASE_URL}#{endpoint}#{query_string}")
        request = Net::HTTP::Post.new("#{url.path}?#{url.query}",{"Content-Type"=>"text/json"})
        request.set_form_data(params)
      end

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      response = JSON.parse(http.start {|http| http.request(request)}.body)
      response
    end
  end

  def self.exchange_access_token(code, client_id, client_secret, callback)
    require 'net/http'

    callback = CGI.escape(callback)

    url = URI.parse("https://foursquare.com:443/oauth2/access_token?client_id=#{client_id}&client_secret=#{client_secret}&grant_type=authorization_code&redirect_uri=#{callback}&code=#{code}")
    request = Net::HTTP::Get.new("#{url.path}?#{url.query}",{"Content-Type"=>"text/json"})
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    response = JSON.parse(http.start {|http| http.request(request)}.body)
    response['access_token']
  end
end
