defmodule FishingSpot.Queries do
  alias FishingSpot.Repo
  alias FishingSpot.FishLanded
  alias FishingSpot.Fisherman

  import Ecto.Query

  def biggest_fish do
    Repo.one(
      from(fish in FishLanded,
        select: max(fish.length)
      )
    )
  end

  # over 24 inches is fishy
  def fishy_fish do
    Repo.all(
      from(fish in FishLanded,
        where: fish.length > 24
      )
    )
  end

  # count fishiness
  def fishy_fish_count do
    Repo.all(
      from(fish in FishLanded,
        select: count(fish.id),
        where: fish.length > 24
      )
    )
  end

  # ---
  def all_fishermen do
    Repo.all(from(fisherman in Fisherman)) |> IO.inspect()

    Repo.all(
      from(fisherman in Fisherman,
        select: fisherman
      )
    )
    |> IO.inspect()

    Repo.all(
      from(fisherman in Fisherman,
        select: [fisherman.name, fisherman.date_of_birth]
      )
    )
    |> IO.inspect()

    Repo.all(
      from(fisherman in Fisherman,
        select: {fisherman.name, fisherman.date_of_birth}
      )
    )
    |> IO.inspect()

    Repo.all(
      from(fisherman in Fisherman,
        select: %{fisherman_name: fisherman.name, fisherman_dob: fisherman.date_of_birth}
      )
    )
    |> IO.inspect()
  end

  def ordered_fishermen do
    Repo.all(
      from(fisherman in Fisherman,
        order_by: fisherman.name,
        select: fisherman.name
      )
    )
    |> IO.inspect()

    Repo.all(
      from(fisherman in Fisherman,
        order_by: [desc: fisherman.name],
        select: fisherman.name
      )
    )
  end

  def biggest_fish_per_fisherman_ordered do
    Repo.all(
      from(fish in FishLanded,
        join: fisherman in assoc(fish, :fisherman),
        group_by: fisherman.name,
        order_by: fisherman.name,
        select: %{biggest_fish: max(fish.length), fisherman: fisherman.name}
      )
    )
  end

  def fish_per_day do
    Repo.all(
      from(fish in FishLanded,
        group_by: fragment("date"),
        order_by: fragment("2"),
        select: %{
          date: fragment("date_trunc('day', ?) AS date", field(fish, :date_and_time)),
          fish_count: count(fish.id)
        }
      )
    )
  end

  def composed_biggest_fish_details do
    query =
      FishLanded
      |> join(:inner, [fish], fly_type in assoc(fish, :fly_type))
      |> join(:inner, [fish, fly_type], fish_species in assoc(fish, :fish_species))
      |> join(:inner, [fish, fly_type, fish_type], fisherman in assoc(fish, :fisherman))
      |> join(:inner, [fish, fly_type, fish_type, fisherman], trip in assoc(fisherman, :trips))
      |> join(
        :inner,
        [fish, fly_type, fish_type, fisherman, trip],
        locations in assoc(trip, :locations)
      )
      |> join(
        :inner,
        [fish, fly_type, fish_type, fisherman, trip, location],
        location_types in assoc(location, :location_type)
      )
      |> select([fish], count(fish.id))

    IO.inspect(query)
    Repo.all(query)

    query =
      FishLanded
      |> join(:inner, [fish], fly_type in assoc(fish, :fly_type))
      |> join(:inner, [fish], fish_species in assoc(fish, :fish_species))
      |> join(:inner, [fish], fisherman in assoc(fish, :fisherman))
      |> join(:inner, [fish, fly_type, fish_type, fisherman], trip in assoc(fisherman, :trips))
      |> join(
        :inner,
        [fish, fly_type, fish_type, fisherman, trip],
        locations in assoc(trip, :locations)
      )
      |> join(
        :inner,
        [fish, fly_type, fish_type, fisherman, trip, location],
        location_types in assoc(location, :location_type)
      )
      |> select([fish], count(fish.id))

    IO.inspect(query)
    Repo.all(query)

    query =
      FishLanded
      |> join(:inner, [fish], fly_type in assoc(fish, :fly_type))
      |> join(:inner, [nemo], fish_species in assoc(nemo, :fish_species))
      |> join(:inner, [bait], fisherman in assoc(bait, :fisherman))
      |> join(:inner, [foo, bar, baz, ahab], trip in assoc(ahab, :trips))
      |> join(:inner, [foo, bar, baz, ahab, set_sail], locations in assoc(set_sail, :locations))
      |> join(:inner, [x, y, z, a, b, c], location_types in assoc(c, :location_type))
      |> select([whatever], count(whatever.id))

    IO.inspect(query)
    Repo.all(query)

    # query =
    # FishLanded
    # |> join(:inner, [fish, foo, bar, baz], fisherman in assoc(fish, :fisherman))
    # |> join(:inner, [fish, fisherman], trip in assoc(fisherman, :trips))
    # |> join(:inner, [fish, trip], locations in assoc(trip, :locations))
    # |> select([fish], count(fish.id))

    # IO.inspect(query)
    # Repo.all(query)

    query =
      FishLanded
      |> join(:inner, [fish], fisherman in assoc(fish, :fisherman))
      |> join(:inner, [fish, fisherman], trip in assoc(fisherman, :trips))
      |> select([fish], count(fish.id))

    IO.inspect(query)
    Repo.all(query)
  end

  def select_associated do
    query =
      Fisherman
      |> join(:inner, [fisherman], fish in assoc(fisherman, :fish_landed))
      |> where([fisherman], fisherman.id == 1)
      |> select([fisherman, fish], %{fisherman: fisherman, length: fish.length})
      |> preload([fisherman, fish], fish_landed: fish)

    Repo.one(query).fisherman.fish_landed |> IO.inspect()

    query =
      Fisherman
      |> join(:inner, [fisherman], fish in assoc(fisherman, :fish_landed))
      |> where([fisherman], fisherman.id == 1)
      |> select([fisherman, fish], %{fisherman: fisherman, length: fish.length})
      |> preload([fisherman, fish], fish_landed: fish)

    fisherman = Repo.one(query) |> List.first()
    fisherman.fish_landed |> IO.inspect()
  end
end
