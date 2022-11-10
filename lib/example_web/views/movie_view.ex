defmodule ExampleWeb.MovieView do
  use ExampleWeb, :view
  alias ExampleWeb.MovieView

  def render("index.json", %{movies: movies}) do
    %{data: render_many(movies, MovieView, "movie.json")}
  end

  def render("show.json", %{movie: movie}) do
    %{data: render_one(movie, MovieView, "movie.json")}
  end

  def render("movie.json", %{movie: movie}) do
    %{
      id: movie.id,
      title: movie.title,
      genre: movie.genre,
      director: movie.director,
      year: movie.year
    }
  end
end
