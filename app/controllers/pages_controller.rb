class PagesController < ApplicationController
	def index
    	@page = Page.new(:ip => request.remote_ip)
    	@page.info
    	@page.hourly
    	@page.radar
	end
end
