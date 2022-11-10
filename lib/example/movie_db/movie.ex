defmodule Example.MovieDB.Movie do
  use Ecto.Schema
  import Ecto.Changeset

  alias Example.MovieDB

  schema "movies" do
    field :title, :string
    field :genre, :string
    field :director, :string
    field :year, :integer

    many_to_many :actors, MovieDB.Actor, join_through: MovieDB.MovieActor

    has_many :reviews, MovieDB.Review

    timestamps()
  end

  @doc false
  def changeset(movie, attrs) do
    movie
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
