defmodule Example.MovieDB.MovieActor do
  use Ecto.Schema
  import Ecto.Changeset

  alias Example.MovieDB

  schema "movie_actors" do
    belongs_to :actor, MovieDB.Actor
    belongs_to :movie, MovieDB.Movie

    timestamps()
  end

  @doc false
  def changeset(actor, attrs) do
    actor
    |> cast(attrs, [:actor, :movie])
    |> validate_required([:actor, :movie])
  end
end
