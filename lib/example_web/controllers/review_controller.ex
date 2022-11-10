defmodule ExampleWeb.ReviewController do
  use ExampleWeb, :controller

  alias Example.MovieDB
  alias Example.MovieDB.Review

  action_fallback ExampleWeb.FallbackController

  def index(conn, _params) do
    reviews = MovieDB.list_reviews()
    render(conn, "index.json", reviews: reviews)
  end

  def movie_index(conn, %{"movie_id" => movie_id}) do
    reviews = MovieDB.list_movie_reviews(movie_id)
    render(conn, "index.json", reviews: reviews)
  end

  def create(conn, %{"review" => review_params}) do
    with {:ok, %Review{} = review} <- MovieDB.create_review(review_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.review_path(conn, :show, review))
      |> render("show.json", review: review)
    end
  end

  def show(conn, %{"id" => id}) do
    review = MovieDB.get_review!(id)
    render(conn, "show.json", review: review)
  end

  def update(conn, %{"id" => id, "review" => review_params}) do
    review = MovieDB.get_review!(id)

    with {:ok, %Review{} = review} <- MovieDB.update_review(review, review_params) do
      render(conn, "show.json", review: review)
    end
  end

  def delete(conn, %{"id" => id}) do
    review = MovieDB.get_review!(id)

    with {:ok, %Review{}} <- MovieDB.delete_review(review) do
      send_resp(conn, :no_content, "")
    end
  end
end
