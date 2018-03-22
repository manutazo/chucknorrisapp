class ChucksController < ApplicationController

	def search
		@query = params[:query]
		@data = ChuckSerarcher.new.search(@query)
		@data = Kaminari.paginate_array(@data).page(params[:page]).per(20)	
		save_search
	end

	def search_by_category
		query = params[:category]
		@data = ChuckSerarcher.new.category(@query)
	end

	def random
		@data = ChuckSerarcher.new.random
	end

	def newsletter
		@user = params[:email]
		@data = ChuckSerarcher.new.search(params[:query])
		if @data.present?
			@data = Kaminari.paginate_array(@data).page(params[:page]).per(20)
			@send = ChuckMailer.newsletter(@email, @data).deliver_now
			 if @send.true?
				format.html { redirect_to search_path(query: params[:query], page: params[:page]), notice: 'Se le ha enviado el mail.' }
    		else
				format.html { redirect_to search_path(query: params[:query], page: params[:page]),  notice: 'No se a podido enviar el mail.' }
   			end
		end
	end

	private

	def save_search
		search = Search.new(:query => @query)
		if search.save
			Result.create(:results => @data, :search_id => search.id)
		end
	end

end
