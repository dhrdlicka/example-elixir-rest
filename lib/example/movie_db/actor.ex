defmodule Example.MovieDB.Actor do
  use Ecto.Schema
  import Ecto.Changeset

  alias Example.MovieDB

  schema "actors" do
    field :name, :string
    field :nationality, :string

    has_many :actor_movies, MovieDB.MovieActor
    has_many :movies, through: [:actor_movies, :movie]

    timestamps()
  end

  @doc false
  def changeset(actor, attrs) do
    actor
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
