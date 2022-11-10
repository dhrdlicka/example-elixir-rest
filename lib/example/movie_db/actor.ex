defmodule Example.MovieDB.Actor do
  use Ecto.Schema
  import Ecto.Changeset

  alias Example.MovieDB

  schema "actors" do
    field :name, :string
    field :nationality, :string
    field :birthday, :date

    many_to_many :movies, MovieDB.Movies, join_through: MovieDB.MovieActor

    timestamps()
  end

  @doc false
  def changeset(actor, attrs) do
    actor
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
