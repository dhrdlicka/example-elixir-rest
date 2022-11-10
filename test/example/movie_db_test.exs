defmodule Example.MovieDBTest do
  use Example.DataCase

  alias Example.MovieDB

  describe "movies" do
    alias Example.MovieDB.Movie

    import Example.MovieDBFixtures

    @invalid_attrs %{title: nil}

    test "list_movies/0 returns all movies" do
      movie = movie_fixture()
      assert MovieDB.list_movies() == [movie]
    end

    test "get_movie!/1 returns the movie with given id" do
      movie = movie_fixture()
      assert MovieDB.get_movie!(movie.id) == movie
    end

    test "create_movie/1 with valid data creates a movie" do
      valid_attrs = %{title: "some title"}

      assert {:ok, %Movie{} = movie} = MovieDB.create_movie(valid_attrs)
      assert movie.title == "some title"
    end

    test "create_movie/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = MovieDB.create_movie(@invalid_attrs)
    end

    test "update_movie/2 with valid data updates the movie" do
      movie = movie_fixture()
      update_attrs = %{title: "some updated title"}

      assert {:ok, %Movie{} = movie} = MovieDB.update_movie(movie, update_attrs)
      assert movie.title == "some updated title"
    end

    test "update_movie/2 with invalid data returns error changeset" do
      movie = movie_fixture()
      assert {:error, %Ecto.Changeset{}} = MovieDB.update_movie(movie, @invalid_attrs)
      assert movie == MovieDB.get_movie!(movie.id)
    end

    test "delete_movie/1 deletes the movie" do
      movie = movie_fixture()
      assert {:ok, %Movie{}} = MovieDB.delete_movie(movie)
      assert_raise Ecto.NoResultsError, fn -> MovieDB.get_movie!(movie.id) end
    end

    test "change_movie/1 returns a movie changeset" do
      movie = movie_fixture()
      assert %Ecto.Changeset{} = MovieDB.change_movie(movie)
    end
  end

  describe "actors" do
    alias Example.MovieDB.Actor

    import Example.MovieDBFixtures

    @invalid_attrs %{name: nil}

    test "list_actors/0 returns all actors" do
      actor = actor_fixture()
      assert MovieDB.list_actors() == [actor]
    end

    test "get_actor!/1 returns the actor with given id" do
      actor = actor_fixture()
      assert MovieDB.get_actor!(actor.id) == actor
    end

    test "create_actor/1 with valid data creates a actor" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Actor{} = actor} = MovieDB.create_actor(valid_attrs)
      assert actor.name == "some name"
    end

    test "create_actor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = MovieDB.create_actor(@invalid_attrs)
    end

    test "update_actor/2 with valid data updates the actor" do
      actor = actor_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Actor{} = actor} = MovieDB.update_actor(actor, update_attrs)
      assert actor.name == "some updated name"
    end

    test "update_actor/2 with invalid data returns error changeset" do
      actor = actor_fixture()
      assert {:error, %Ecto.Changeset{}} = MovieDB.update_actor(actor, @invalid_attrs)
      assert actor == MovieDB.get_actor!(actor.id)
    end

    test "delete_actor/1 deletes the actor" do
      actor = actor_fixture()
      assert {:ok, %Actor{}} = MovieDB.delete_actor(actor)
      assert_raise Ecto.NoResultsError, fn -> MovieDB.get_actor!(actor.id) end
    end

    test "change_actor/1 returns a actor changeset" do
      actor = actor_fixture()
      assert %Ecto.Changeset{} = MovieDB.change_actor(actor)
    end
  end

  describe "reviews" do
    alias Example.MovieDB.Review

    import Example.MovieDBFixtures

    @invalid_attrs %{content: nil}

    test "list_reviews/0 returns all reviews" do
      review = review_fixture()
      assert MovieDB.list_reviews() == [review]
    end

    test "get_review!/1 returns the review with given id" do
      review = review_fixture()
      assert MovieDB.get_review!(review.id) == review
    end

    test "create_review/1 with valid data creates a review" do
      valid_attrs = %{content: "some content"}

      assert {:ok, %Review{} = review} = MovieDB.create_review(valid_attrs)
      assert review.content == "some content"
    end

    test "create_review/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = MovieDB.create_review(@invalid_attrs)
    end

    test "update_review/2 with valid data updates the review" do
      review = review_fixture()
      update_attrs = %{content: "some updated content"}

      assert {:ok, %Review{} = review} = MovieDB.update_review(review, update_attrs)
      assert review.content == "some updated content"
    end

    test "update_review/2 with invalid data returns error changeset" do
      review = review_fixture()
      assert {:error, %Ecto.Changeset{}} = MovieDB.update_review(review, @invalid_attrs)
      assert review == MovieDB.get_review!(review.id)
    end

    test "delete_review/1 deletes the review" do
      review = review_fixture()
      assert {:ok, %Review{}} = MovieDB.delete_review(review)
      assert_raise Ecto.NoResultsError, fn -> MovieDB.get_review!(review.id) end
    end

    test "change_review/1 returns a review changeset" do
      review = review_fixture()
      assert %Ecto.Changeset{} = MovieDB.change_review(review)
    end
  end
end
