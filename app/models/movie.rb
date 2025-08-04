class Movie < ActiveRecord::Base
  def self.find_in_tmdb(params, api_key = '64b1dbf53a84f5c6c6cd8682bab1cc5f')
    base_uri = 'https://api.themoviedb.org/3/search/movie'
    
    query_params = { 
      api_key: api_key, 
      query: params[:title], 
      year: params[:release_year], 
      language: params[:language] 
    }

    response = Faraday.get(base_uri, query_params)
    
    data = JSON.parse(response.body)

    if data && data['results']
      return data['results'].map do |movie_data|
        Movie.new(
          title: movie_data['title'],
          release_date: movie_data['release_date'],
          description: movie_data['overview'],
          rating: 'R'
        )
      end
    else
      return []
    end
  end
end
