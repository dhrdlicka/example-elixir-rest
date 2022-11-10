defmodule Example.MovieDBFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Example.MovieDB` context.
  """

  @doc """
  Generate a movie.
  """
  def movie_fixture(attrs \\ %{}) do
    {:ok, movie} =
      attrs
      |> Enum.into(%{
        title: "some title"
      })
      |> Example.MovieDB.create_movie()

    movie
  end

  @doc """
  Generate a actor.
  """
  def actor_fixture(attrs \\ %{}) do
    {:ok, actor} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Example.MovieDB.create_actor()

    actor
  end

  @doc """
  Generate a review.
  """
  def review_fixture(attrs \\ %{}) do
    {:ok, review} =
      attrs
      |> Enum.into(%{
        content: "some content"
      })
      |> Example.MovieDB.create_review()

    review
  end
end
