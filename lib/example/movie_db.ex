defmodule Example.MovieDB do
  @moduledoc """
  The MovieDB context.
  """

  import Ecto.Query, warn: false
  alias Example.Repo

  alias Example.MovieDB.Actor
  alias Example.MovieDB.Movie
  alias Example.MovieDB.MovieActor
  alias Example.MovieDB.Review

  defp filter_movies(movies, params) do
    movies = case params do
      %{"year" => year} -> movies |> where([m], m.year == ^year)
      _ -> movies
    end

    movies = case params do
      %{"title" => title} -> movies |> where([m], like(m.title, ^"%#{String.replace(title, "%", "\\%")}%"))
      _ -> movies
    end

    movies = case params do
      %{"genre" => genre} -> movies |> where([m], like(m.genre, ^"%#{String.replace(genre, "%", "\\%")}%"))
      _ -> movies
    end

    movies
  end

  @doc """
  Returns the list of movies.

  ## Examples

      iex> list_movies()
      [%Movie{}, ...]

  """
  def list_movies(params = %{}) do
    Movie
    |> filter_movies(params)
    |> Repo.all
  end

  @doc """
  Returns the list of movies with a given actor.

  ## Examples

      iex> list_actor_movies(actor_id)
      [%Movie{}, ...]

  """
  def list_actor_movies(actor_id, params = %{}) do
    Movie
    |> join(:inner, [m], ma in MovieActor, on: m.id == ma.movie_id)
    |> where([_, ma], ma.actor_id == ^actor_id)
    |> filter_movies(params)
    |> Repo.all
  end

  @doc """
  Gets a single movie.

  Raises `Ecto.NoResultsError` if the Movie does not exist.

  ## Examples

      iex> get_movie!(123)
      %Movie{}

      iex> get_movie!(456)
      ** (Ecto.NoResultsError)

  """
  def get_movie!(id), do: Repo.get!(Movie, id)

  @doc """
  Creates a movie.

  ## Examples

      iex> create_movie(%{field: value})
      {:ok, %Movie{}}

      iex> create_movie(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_movie(attrs \\ %{}) do
    %Movie{}
    |> Movie.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a movie.

  ## Examples

      iex> update_movie(movie, %{field: new_value})
      {:ok, %Movie{}}

      iex> update_movie(movie, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_movie(%Movie{} = movie, attrs) do
    movie
    |> Movie.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a movie.

  ## Examples

      iex> delete_movie(movie)
      {:ok, %Movie{}}

      iex> delete_movie(movie)
      {:error, %Ecto.Changeset{}}

  """
  def delete_movie(%Movie{} = movie) do
    Repo.delete(movie)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking movie changes.

  ## Examples

      iex> change_movie(movie)
      %Ecto.Changeset{data: %Movie{}}

  """
  def change_movie(%Movie{} = movie, attrs \\ %{}) do
    Movie.changeset(movie, attrs)
  end

  defp filter_actors(actors, params = %{}) do
    actors = case params do
      %{"name" => name} -> actors |> where([a], like(a.name, ^"%#{String.replace(name, "%", "\\%")}%"))
      _ -> actors
    end

    actors = case params do
      %{"nationality" => nationality} -> actors |> where([a], like(a.nationality, ^"%#{String.replace(nationality, "%", "\\%")}%"))
      _ -> actors
    end

    actors
  end

  @doc """
  Returns the list of actors.

  ## Examples

      iex> list_actors()
      [%Actor{}, ...]

  """
  def list_actors(params = %{}) do
    Actor
    |> filter_actors(params)
    |> Repo.all
  end

  @doc """
  Returns the list of actors in a movie.

  ## Examples

      iex> list_movie_actors(movie_id)
      [%Actor{}, ...]

  """
  def list_movie_actors(movie_id, params = %{}) do
    Actor
    |> join(:inner, [a], ma in MovieActor, on: a.id == ma.actor_id)
    |> where([_, ma], ma.movie_id == ^movie_id)
    |> filter_actors(params)
    |> Repo.all
  end

  @doc """
  Gets a single actor.

  Raises `Ecto.NoResultsError` if the Actor does not exist.

  ## Examples

      iex> get_actor!(123)
      %Actor{}

      iex> get_actor!(456)
      ** (Ecto.NoResultsError)

  """
  def get_actor!(id), do: Repo.get!(Actor, id)

  @doc """
  Creates a actor.

  ## Examples

      iex> create_actor(%{field: value})
      {:ok, %Actor{}}

      iex> create_actor(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_actor(attrs \\ %{}) do
    %Actor{}
    |> Actor.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a actor.

  ## Examples

      iex> update_actor(actor, %{field: new_value})
      {:ok, %Actor{}}

      iex> update_actor(actor, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_actor(%Actor{} = actor, attrs) do
    actor
    |> Actor.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a actor.

  ## Examples

      iex> delete_actor(actor)
      {:ok, %Actor{}}

      iex> delete_actor(actor)
      {:error, %Ecto.Changeset{}}

  """
  def delete_actor(%Actor{} = actor) do
    Repo.delete(actor)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking actor changes.

  ## Examples

      iex> change_actor(actor)
      %Ecto.Changeset{data: %Actor{}}

  """
  def change_actor(%Actor{} = actor, attrs \\ %{}) do
    Actor.changeset(actor, attrs)
  end

  defp filter_reviews(reviews, params = %{}) do
    reviews = case params do
      %{"stars" => stars} -> reviews |> where([r], r.stars == ^stars)
      _ -> reviews
    end

    reviews = case params do
      %{"author" => author} -> reviews |> where([r], like(r.author, ^"%#{String.replace(author, "%", "\\%")}%"))
      _ -> reviews
    end

    reviews
  end

  @doc """
  Returns the list of reviews.

  ## Examples

      iex> list_reviews()
      [%Review{}, ...]

  """
  def list_reviews(params = %{}) do
    Review
    |> filter_reviews(params)
    |> Repo.all
  end

  @doc """
  Returns the list of reviews for a movie.

  ## Examples

      iex> list_movie_reviews(movie_id)
      [%Review{}, ...]

  """
  def list_movie_reviews(movie_id, params = %{}) do
    Review
    |> where([r], r.movie_id == ^movie_id)
    |> filter_reviews(params)
    |> Repo.all
  end

  @doc """
  Gets a single review.

  Raises `Ecto.NoResultsError` if the Review does not exist.

  ## Examples

      iex> get_review!(123)
      %Review{}

      iex> get_review!(456)
      ** (Ecto.NoResultsError)

  """
  def get_review!(id), do: Repo.get!(Review, id)

  @doc """
  Creates a review.

  ## Examples

      iex> create_review(%{field: value})
      {:ok, %Review{}}

      iex> create_review(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_review(attrs \\ %{}) do
    %Review{}
    |> Review.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a review.

  ## Examples

      iex> update_review(review, %{field: new_value})
      {:ok, %Review{}}

      iex> update_review(review, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_review(%Review{} = review, attrs) do
    review
    |> Review.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a review.

  ## Examples

      iex> delete_review(review)
      {:ok, %Review{}}

      iex> delete_review(review)
      {:error, %Ecto.Changeset{}}

  """
  def delete_review(%Review{} = review) do
    Repo.delete(review)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking review changes.

  ## Examples

      iex> change_review(review)
      %Ecto.Changeset{data: %Review{}}

  """
  def change_review(%Review{} = review, attrs \\ %{}) do
    Review.changeset(review, attrs)
  end
end
