FROM elixir:1.14
ADD . /app
WORKDIR /app
RUN mix do local.hex --force ++ deps.get ++ ecto.setup
CMD mix phx.server
