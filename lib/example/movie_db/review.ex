defmodule Example.MovieDB.Review do
  use Ecto.Schema
  import Ecto.Changeset

  alias Example.MovieDB

  schema "reviews" do
    field :author, :string
    field :content, :string
    field :stars, :integer

    belongs_to :movie, MovieDB.Movie

    timestamps()
  end

  @doc false
  def changeset(review, attrs) do
    review
    |> cast(attrs, [:author, :content, :stars, :movie])
    |> validate_required([:author, :content, :stars, :movie])
    |> validate_inclusion(:stars, 1..5)
  end
end
