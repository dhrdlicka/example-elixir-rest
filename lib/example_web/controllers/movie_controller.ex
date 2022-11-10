defmodule ExampleWeb.MovieController do
  use ExampleWeb, :controller

  alias Example.MovieDB
  alias Example.MovieDB.Movie

  action_fallback ExampleWeb.FallbackController

  def index(conn, _params) do
    movies = MovieDB.list_movies()
    render(conn, "index.json", movies: movies)
  end

  def actor_index(conn, %{"actor_id" => actor_id}) do
    movies = MovieDB.list_actor_movies(actor_id)
    render(conn, "index.json", movies: movies)
  end

  def create(conn, %{"movie" => movie_params}) do
    with {:ok, %Movie{} = movie} <- MovieDB.create_movie(movie_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.movie_path(conn, :show, movie))
      |> render("show.json", movie: movie)
    end
  end

  def show(conn, %{"id" => id}) do
    movie = MovieDB.get_movie!(id)
    render(conn, "show.json", movie: movie)
  end

  def update(conn, %{"id" => id, "movie" => movie_params}) do
    movie = MovieDB.get_movie!(id)

    with {:ok, %Movie{} = movie} <- MovieDB.update_movie(movie, movie_params) do
      render(conn, "show.json", movie: movie)
    end
  end

  def delete(conn, %{"id" => id}) do
    movie = MovieDB.get_movie!(id)

    with {:ok, %Movie{}} <- MovieDB.delete_movie(movie) do
      send_resp(conn, :no_content, "")
    end
  end
end
