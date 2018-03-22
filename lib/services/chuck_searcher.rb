require 'httparty'
class ChuckSerarcher
  include HTTParty
  base_uri 'api.chucknorris.io'

  def search(name)
    url = "/jokes/search?query=#{name}"
    self.class.get(url)['result']
  end

  def category(category)
    url = "/jokes/random?category=#{category}"
    self.class.get(url)
  end

  def random
    url = "/jokes/random"
    self.class.get(url)
  end
end