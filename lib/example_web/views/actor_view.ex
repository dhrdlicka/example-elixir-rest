defmodule ExampleWeb.ActorView do
  use ExampleWeb, :view
  alias ExampleWeb.ActorView

  def render("index.json", %{actors: actors}) do
    %{data: render_many(actors, ActorView, "actor.json")}
  end

  def render("show.json", %{actor: actor}) do
    %{data: render_one(actor, ActorView, "actor.json")}
  end

  def render("actor.json", %{actor: actor}) do
    %{
      id: actor.id,
      name: actor.name,
      nationality: actor.nationality,
      birthday: actor.birthday
    }
  end
end
