require 'bundler'
Bundler.require

require 'pry'

configure do
  $redis = Redis.connect
end

helpers do
  def cache time: 3600
    url = "/url/#{request.path}"
    content = $redis.get(url)
    if content.nil?
      content = yield
      $redis.setex(url, time, content)
    end
    content
  end
end

get '/' do
  erb :index
end


get '/image/:slug/:page' do
  redirect(cache {
    http = Curl.get("https://www.comic-rocket.com/api/1/serial/#{params[:slug]}/#{params[:page]}/")
    json = MultiJson.load(http.body_str)
    html = Nokogiri.HTML(Curl.get(json['url']).body_str)
    html.css('#comicarea a img').attr('src')
  })
end
