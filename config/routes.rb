Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  root to: redirect('/movies')
  post '/movies/search_tmdb', to: 'movies#search_tmdb', as: 'search_tmdb_movies'
  post '/movies/add_movie', to: 'movies#add_movie', as: 'add_movie'
end