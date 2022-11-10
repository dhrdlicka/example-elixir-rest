# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Example.Repo.insert!(%Example.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Example.MovieDB

Example.Repo.insert!(%MovieDB.Movie{
  title: "Avengers: Endgame",
  year: 2019,
  director: "Anthony Russo, Joe Russo",
  genre: "Superhero",
  reviews: [
    %MovieDB.Review{
      author: "alice@example.com",
      date: DateTime.utc_now |> DateTime.truncate(:second),
      stars: 5,
      content: "This is the first review for a movie."
    },
    %MovieDB.Review{
      author: "bob@example.com",
      date: DateTime.utc_now |> DateTime.truncate(:second),
      stars: 4,
      content: "This is the second review for a movie."
    }
  ]
})

Example.Repo.insert!(%MovieDB.Movie{
  title: "Black Panther",
  year: 2018,
  director: "Ryan Coogler",
  genre: "Superhero",
  reviews: [
    %MovieDB.Review{
      author: "alice@example.com",
      date: DateTime.utc_now |> DateTime.truncate(:second),
      stars: 4,
      content: "This is the first review for a movie."
    },
    %MovieDB.Review{
      author: "bob@example.com",
      date: DateTime.utc_now |> DateTime.truncate(:second),
      stars: 3,
      content: "This is the second review for a movie."
    }
  ]
})

Example.Repo.insert!(%MovieDB.Movie{
  title: "Shrek",
  year: 2001,
  director: "Andrew Adamson, Vicky Jenson",
  genre: "Animated",
  reviews: [
    %MovieDB.Review{
      author: "dave@example.com",
      date: DateTime.utc_now |> DateTime.truncate(:second),
      stars: 5,
      content: "This is the first review for a movie."
    },
    %MovieDB.Review{
      author: "frank@example.com",
      date: DateTime.utc_now |> DateTime.truncate(:second),
      stars: 4,
      content: "This is the second review for a movie."
    },
    %MovieDB.Review{
      author: "chad@example.com",
      date: DateTime.utc_now |> DateTime.truncate(:second),
      stars: 1,
      content: "This is a review with many emojis. 🌚 🌕 🌖 🌗 🌘 🌑 🌒 🌓 🌔 🌙 🌎 🌍 🌏 🪐 💫 ⭐️ 🌟"
    },
  ]
})

Example.Repo.insert!(%MovieDB.Actor{
  name: "Robert Downey Jr.",
  nationality: "US",
  birthday: Date.new!(1965, 4, 4)
})

Example.Repo.insert!(%MovieDB.Actor{
  name: "Chadwick Boseman",
  nationality: "US",
  birthday: Date.new!(1976, 11, 29)
})

Example.Repo.insert!(%MovieDB.Actor{
  name: "Eddie Murphy",
  nationality: "US",
  birthday: Date.new!(1961, 4, 3)
})

Example.Repo.insert!(%MovieDB.MovieActor{movie_id: 1, actor_id: 1})
Example.Repo.insert!(%MovieDB.MovieActor{movie_id: 1, actor_id: 2})
Example.Repo.insert!(%MovieDB.MovieActor{movie_id: 2, actor_id: 2})
Example.Repo.insert!(%MovieDB.MovieActor{movie_id: 3, actor_id: 3})
