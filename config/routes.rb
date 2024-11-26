Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	get '/' => 'home#index' # 글을 읽는 페이지
	get '/write' => 'home#write'
	post '/create' => 'home#create'
end
