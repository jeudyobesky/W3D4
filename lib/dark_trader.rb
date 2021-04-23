require 'rubygems'
require 'nokogiri'
require 'open-uri'


def cours_crypto 
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	@val = []
	@name = []
	page.xpath('//h').each do |x|
		if x.include?('class="currency-name-container link-secondary"')
			@name << x.text
  		elsif x.to_s.include?('class="price"')
			@val << x.text
		end	
	end
	return @prix, @nom
end

p cours_crypto
hah_crypto = Hash[@name.zip(@val)]
puts hah_crypto

