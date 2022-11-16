FROM elixir:1.14

# prepare build dir
WORKDIR /app

# install hex + rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# set build ENV
ENV MIX_ENV=dev

# install mix dependencies
COPY mix.exs mix.lock ./
COPY config config
RUN mix deps.get
RUN mix deps.compile

# build project
COPY priv priv
COPY lib lib
RUN mix compile

# generate the example database
RUN mix ecto.setup

# start the Phoenix server by default
CMD mix phx.server

# Phoenix listens on port 4000
EXPOSE 4000/tcp
