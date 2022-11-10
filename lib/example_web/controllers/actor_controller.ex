defmodule ExampleWeb.ActorController do
  use ExampleWeb, :controller

  alias Example.MovieDB
  alias Example.MovieDB.Actor

  action_fallback ExampleWeb.FallbackController

  def index(conn, _params) do
    actors = MovieDB.list_actors()
    render(conn, "index.json", actors: actors)
  end

  def create(conn, %{"actor" => actor_params}) do
    with {:ok, %Actor{} = actor} <- MovieDB.create_actor(actor_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.actor_path(conn, :show, actor))
      |> render("show.json", actor: actor)
    end
  end

  def show(conn, %{"id" => id}) do
    actor = MovieDB.get_actor!(id)
    render(conn, "show.json", actor: actor)
  end

  def update(conn, %{"id" => id, "actor" => actor_params}) do
    actor = MovieDB.get_actor!(id)

    with {:ok, %Actor{} = actor} <- MovieDB.update_actor(actor, actor_params) do
      render(conn, "show.json", actor: actor)
    end
  end

  def delete(conn, %{"id" => id}) do
    actor = MovieDB.get_actor!(id)

    with {:ok, %Actor{}} <- MovieDB.delete_actor(actor) do
      send_resp(conn, :no_content, "")
    end
  end
end
