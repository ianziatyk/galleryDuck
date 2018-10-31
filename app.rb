require 'sinatra'
require "sendgrid-ruby"
include SendGrid


get "/" do
	
	erb :home
end


get "/about" do

	# class Cookie
	# 	def initialize(price,description,url)
	# 		@price = price
	# 		@description = description
	# 		@url = url
	# 	end
	# 	def get_url
	# 		return @url
	# 	end
	# end
	# @c1 = Cookie.new(6, 'super good and expensive', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f1/2ChocolateChipCookies.jpg/2560px-2ChocolateChipCookies.jpg')

	erb :about
end


get "/store" do


	erb :store
end

get "/film" do

	class Films
		def initialize(type,size,price,description,url)
			@type = type
			@size = size
			@price = price
			@description = description
			@url = url
		end
	def get_type
		 		return @type
			 end
	def get_size
				return @size
			end
	def get_price
				return @price
			end
	def get_des
				return @description
			end
	def get_url
				return @url
			end
end
	
	@film1 = Films.new('Kodak Tri-X 400','35mm', 7.49, "Kodak's Professional Tri-X 400 Black and White Negative Film is a classic high-speed panchromatic film designed for a wide array of shooting conditions. Characterized by its fine grain quality, notable edge sharpness, and high resolving power, Tri-X 400 also exhibits a wide exposure latitude with consistent tonality. It has a nominal sensitivity of ISO 400/27° when developed in standard black and white chemistry, and responds well to push processing. As an all-around, highly versatile film, Tri-X 400 is a standard choice for photographing in difficult lighting conditions as well as when working with subjects requiring good depth of field or for faster shutter speeds.", 'css/images/kodak.png')
	@film2 = Films.new('Ilford Delta 400','35mm', 9, "Ilford's Delta 400 Professional is a high-speed black and white negative film featuring core-shell crystal technology in order to produce high sharpness with a fine, uniform grain structure. It has a nominal sensitivity of ISO 400/27° when developed in standard black and white chemistry, making it well-suited to handheld photography and working in difficult lighting conditions. This versatile film also features a broad tonal range and a wide exposure latitude, which is capable of being rated between EI 200 to EI 3200 and being pushed or pulled during development in order to maintain consistent contrast.  This item is one 36-exposure roll of 35mm film in a DX-coded cassette.", 'css/images/Illford.png')
	@film3 = Films.new('FUJIFILM Fujicolor PRO 400H','120 Film', 10, 'FUJIFILM Fujicolor PRO 400H Professional from B&H is a high-speed daylight-balanced color negative film with a nominal sensitivity of ISO 400/27° when processed in C-41 chemistry. Featuring fourth layer color and Interlayer effect technologies, this film exhibits a soft contrast profile with faithful, yet vivid, color reproduction. It produces smooth and natural skin tones and has a broad exposure latitude, making it suitable for general photographic applications and working in a wide variety of lighting conditions. Additionally, Fine Sigma Technology yields an unobtrusive, fine grain structure that helps to maintain effective film speeds and produce smoother surface textures to benefit scanning and printing applications.', 'css/images/fujiG.png')

	@heynow = [@film1,@film2,@film3]
	
	
	erb :film
end


get "/cameras" do

	class Cameras
		def initialize(type,size,price,description,url)
			@type = type
			@size = size
			@price = price
			@description = description
			@url = url
		end
	def get_type
		 		return @type
			 end
	def get_size
				return @size
			end
	def get_price
				return @price
			end
	def get_des
				return @description
			end
	def get_url
				return @url
			end
end

@camera1 = Cameras.new("Canon 5d markii", "Full-Frame", 3499.00, "The first full frame camera with live view and video. A modern classic that launched the HDSLR age", 'css/images/5d2.png')
@camera2 = Cameras.new("Canon AE-1", "Full-Frame", 249.99, "The first Canon camera with PASM", 'css/images/5d2.png')
@camera3 = Cameras.new("Canon 5d markii", "Full-Frame", 3499.00, "The first full frame camera with live view and video. A modern classic that launched the HDSLR age", 'css/images/5d2.png')


@camNow = [@camera1,@camera2,@camera3]



	erb :cameras
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