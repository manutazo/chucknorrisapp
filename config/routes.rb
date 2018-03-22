Rails.application.routes.draw do

	get "/", to: "pages#index"
	get "/search", to: "chucks#search"
	get "/search-by-category", to: "chucks#search_by_category"
	get "/random", to: "chucks#random"
	post "/send-newsletter", to: "chucks#newsletter"

end
