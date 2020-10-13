# aliases ready in iex
alias FishingSpot.{
  Repo,
  Location,
  LocationTrip,
  LocationType,
  Fisherman,
  FishermanTrip,
  FishLanded,
  FishSpecies,
  FlyType,
  Trip
}

import Ecto.Query

# call `q.()` to reload queries
q = fn -> c("lib/queries.exs") end
