class HomeController < ApplicationController
  def index

  	@price = nil
  	@currency = nil

  	if params[:search]

  		@currency = params_choice[:choice]

  	end

  	@currencies = NokogiriFetch.new.all_currencies

  	@price = NokogiriFetch.new.perform(@currency)


  end

private

def params_choice

	params.require(:search).permit(:choice)
	
end

end