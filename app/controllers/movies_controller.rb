class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  def create

    n = Movie.new
    n.title = params.fetch("query_title")
    n.year = params.fetch("query_year")
    n.duration = params.fetch("query_duration")
    n.description = params.fetch("query_description")
    n.image = params.fetch("query_image")
    n.director_id = params.fetch("query_director_id")

    n.save

    redirect_to("/movies")

 
  end

  def destroy
    the_id = params.fetch("an_id")
     matching_records = Movie.where({ :id => the_id })
     the_movie = matching_records.at(0)
     the_movie.destroy
     redirect_to("/movies")


  end

end
