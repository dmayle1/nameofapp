class StaticPagesController < ApplicationController
  def index
  end


def landing_page
	@featured_product = Product.first
end

  def thank_you
  	@name = params[:name]
  	@email = params[:email]
  	@message = params[:message]
  	UserMailer.contact_form(@email, @name, @message).deliver

  end

end