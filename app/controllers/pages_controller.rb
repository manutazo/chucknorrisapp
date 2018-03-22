class PagesController < ApplicationController

	def index
		@categorys = %w(explicit dev movie food celebrity science sport political religion  animal history music travel career money fashion)
	end
	
end
