require 'httparty'

class ApiCaller
  attr_reader :url

  def initialize(url)
    @url = url
  end

  def get
    response = HTTParty.get(url)
    response.body
  end
end
