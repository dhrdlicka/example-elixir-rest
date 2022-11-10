defmodule ExampleWeb.Router do
  use ExampleWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ExampleWeb do
    resources "/actors", ActorController, except: [:new, :edit] do
      get "/movies", MovieController, :actor_index
    end

    resources "/movies", MovieController, except: [:new, :edit] do
      get "/actors", ActorController, :movie_index
      get "/reviews", ReviewController, :movie_index
    end

    resources "/reviews", ReviewController, except: [:new, :edit]
    pipe_through :api
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: ExampleWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
