defmodule Example.Repo.Migrations.CreateMovies do
  use Ecto.Migration

  def change do
    create table(:movies) do
      add :title, :string
      add :genre, :string
      add :director, :string

      timestamps()
    end

    create table(:actors) do
      add :name, :string

      timestamps()
    end

    create table(:reviews) do
      add :author, :string
      add :content, :string
      add :stars, :integer

      add :movie, references(:movies)

      timestamps()
    end

    create table(:movie_actors) do
      add :movie, references(:movies)
      add :actor, references(:actors)

      timestamps()
    end
  end
end
