defmodule Example.Repo.Migrations.CreateMovies do
  use Ecto.Migration

  def change do
    create table(:movies) do
      add :title, :string
      add :genre, :string
      add :director, :string
      add :year, :integer

      timestamps()
    end

    create table(:actors) do
      add :name, :string
      add :nationality, :string
      add :birthday, :date

      timestamps()
    end

    create table(:reviews) do
      add :author, :string
      add :content, :string
      add :stars, :integer
      add :date, :utc_datetime

      add :movie_id, references(:movies)

      timestamps()
    end

    create table(:movie_actors) do
      add :movie_id, references(:movies)
      add :actor_id, references(:actors)

      timestamps()
    end
  end
end
