defmodule ExampleWeb.ReviewView do
  use ExampleWeb, :view
  alias ExampleWeb.ReviewView

  def render("index.json", %{reviews: reviews}) do
    %{data: render_many(reviews, ReviewView, "review.json")}
  end

  def render("show.json", %{review: review}) do
    %{data: render_one(review, ReviewView, "review.json")}
  end

  def render("review.json", %{review: review}) do
    %{
      id: review.id,
      movie_id: review.movie_id,
      author: review.author,
      date: review.date,
      stars: review.stars,
      content: review.content
    }
  end
end
