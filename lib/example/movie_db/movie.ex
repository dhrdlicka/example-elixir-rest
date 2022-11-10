defmodule Example.MovieDB.Movie do
  use Ecto.Schema
  import Ecto.Changeset

  alias Example.MovieDB

  schema "movies" do
    field :title, :string
    field :genre, :string
    field :director, :string
    field :year, :integer

    has_many :movie_actors, MovieDB.MovieActor
    has_many :actors, through: [:movie_actors, :actor]

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
