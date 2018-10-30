require 'sinatra'
require "sendgrid-ruby"
include SendGrid


get "/" do
	
	erb :home
end
get "/about" do

	class Cookie
		def initialize(price,description,url)
			@price = price
			@description = description
			@url = url
		end
		def get_url
			return @url
		end
	end
	@c1 = Cookie.new(6, 'super good and expensive', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f1/2ChocolateChipCookies.jpg/2560px-2ChocolateChipCookies.jpg')

	erb :about
end

get '/products' do
	@products = ["hello","hello","hello","hello","hello"]
	erb :products
end

get '/search' do
	@search_term = params[:search_term]

	erb :search
end

get "/contact" do
erb :contact
end

post '/email' do
	
from = Email.new(email: params[:email])
to = Email.new(email: 'ian.ziatyk@gmail.com')
subject = params[:subject]
content = Content.new(type: 'text/plain', value: params[:body])
mail = Mail.new(from, subject, to, content)

sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
response = sg.client.mail._('send').post(request_body: mail.to_json)
puts response.status_code
puts response.body
puts response.headers

 redirect '/thanks'
end

get '/thanks' do
	
erb :thanks
end


get "/login" do
	username = params[:username]
	password = params[:password]
	if password == '1234' && username == 'oggidan' 
			redirect "/search"
		else 
			erb :home
		end
end