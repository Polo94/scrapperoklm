require 'open-uri'
require 'nokogiri'

class NokogiriFetch

	def initialize

		@page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")) 

		@name_list = @page.css('a.currency-name-container') 
		@price_list = @page.css('a.price') 

	end

	def perform(name)


		@tab = Hash.new 

		for i in 0 .. (@name_list.length-1)
			@tab[@name_list[i].text] = @price_list[i]['data-usd'] 
		end
	

	  return @tab[name]

	end

	def all_currencies

		@currencies = @name_list.map{|i| i.text}

	end

end