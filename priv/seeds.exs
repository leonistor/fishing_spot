defmodule FishingSpot.Data do
  alias FishingSpot.{
    Repo,
    Locations,
    LocationsTrips,
    LocationTypes,
    Fishermen,
    FishermenTrips,
    FishLanded,
    FishSpecies,
    FlyTypes,
    Trips
  }

  import Ecto.Query

  def generate do
    # Mix.Task.run("ecto.drop", [FishingSpot.Repo])
    # Mix.Task.run("ecto.create", [FishingSpot.Repo])
    # Mix.Task.run("ecto.migrate", [FishingSpot.Repo])
    _generate()
  end

  defp _generate do
    IO.puts("Generating:")

    IO.puts("...FishSpecies")
    rainbow_trout = Repo.insert!(%FishSpecies{name: "Rainbow Trout"})
    brown_trout = Repo.insert!(%FishSpecies{name: "Brown Trout"})
    lake_trout = Repo.insert!(%FishSpecies{name: "Lake Trout"})
    brook_trout = Repo.insert!(%FishSpecies{name: "Brook Trout"})
    cutthroat_trout = Repo.insert!(%FishSpecies{name: "Cutthroat Trout"})
    fish_types = [rainbow_trout, brown_trout, lake_trout, brook_trout, cutthroat_trout]

    IO.puts("...FlyTypes")
    muddler = Repo.insert!(%FlyTypes{name: "Muddler Minnow"})
    hares_ear = Repo.insert!(%FlyTypes{name: "Hare's' Ear"})
    copper_john = Repo.insert!(%FlyTypes{name: "Copper John"})
    royal_wulff = Repo.insert!(%FlyTypes{name: "Royal Wulff"})
    morning_dunn = Repo.insert!(%FlyTypes{name: "Morning Dunn"})
    flies = [muddler, hares_ear, copper_john, royal_wulff, morning_dunn]

    IO.puts("...LocationTypes")
    lake = Repo.insert!(%LocationTypes{name: "Lake"})
    pond = Repo.insert!(%LocationTypes{name: "Pond"})
    spring_creek = Repo.insert!(%LocationTypes{name: "Spring Creek"})
    _stream = Repo.insert!(%LocationTypes{name: "Stream"})
    river = Repo.insert!(%LocationTypes{name: "River"})
    tail_water = Repo.insert!(%LocationTypes{name: "Tail Water"})

    IO.puts("...Fishermen")

    mark =
      Repo.insert!(%Fishermen{name: "Mark", date_of_birth: %Date{year: 1970, month: 12, day: 25}})

    joe =
      Repo.insert!(%Fishermen{name: "Joe", date_of_birth: %Date{year: 1973, month: 10, day: 2}})

    kirk =
      Repo.insert!(%Fishermen{name: "Kirk", date_of_birth: %Date{year: 1980, month: 7, day: 21}})

    lew =
      Repo.insert!(%Fishermen{name: "Lew", date_of_birth: %Date{year: 1981, month: 1, day: 11}})

    _fishermen = [mark, joe, kirk, lew]

    IO.puts("...Trips")
    trip1 = Repo.insert!(%Trips{start_date: ~D[2012-06-05], end_date: ~D[2012-06-12]})
    trip2 = Repo.insert!(%Trips{start_date: ~D[2012-10-15], end_date: ~D[2012-10-22]})
    trip3 = Repo.insert!(%Trips{start_date: ~D[2013-09-01], end_date: ~D[2013-09-08]})
    trip4 = Repo.insert!(%Trips{start_date: ~D[2014-07-15], end_date: ~D[2014-07-22]})
    trip5 = Repo.insert!(%Trips{start_date: ~D[2014-08-08], end_date: ~D[2014-08-15]})

    _trips = [trip1, trip2, trip3, trip4, trip5]

    IO.puts("...Locations")

    lake_fork =
      Repo.insert!(%Locations{
        name: "Lake Fork",
        altitude: 8000,
        lat: Decimal.from_float(38.090942),
        long: Decimal.from_float(-107.292869),
        location_type_id: river.id
      })

    blue_mesa =
      Repo.insert!(%Locations{
        name: "Blue Mesa",
        altitude: 7000,
        lat: Decimal.from_float(38.472406),
        long: Decimal.from_float(-107.210268),
        location_type_id: lake.id
      })

    main_elk =
      Repo.insert!(%Locations{
        name: "Main Elk Creek",
        altitude: 7000,
        lat: Decimal.from_float(39.729579),
        long: Decimal.from_float(-107.545462),
        location_type_id: spring_creek.id
      })

    frying_pan =
      Repo.insert!(%Locations{
        name: "Frying Pan Tailwater",
        altitude: 6000,
        lat: Decimal.from_float(39.363448),
        long: Decimal.from_float(-106.823121),
        location_type_id: tail_water.id
      })

    unamed_pond =
      Repo.insert!(%Locations{
        name: "Unamed Pond",
        altitude: 5000,
        lat: Decimal.from_float(39.887929),
        long: Decimal.from_float(-107.354998),
        location_type_id: pond.id
      })

    white_river =
      Repo.insert!(%Locations{
        name: "North Fork White River",
        altitude: 5000,
        lat: Decimal.from_float(40.051879),
        long: Decimal.from_float(-107.458016),
        location_type_id: pond.id
      })

    locations = [lake_fork, blue_mesa, main_elk, frying_pan, unamed_pond, white_river]

    IO.puts("...Trip to Locations")
    Repo.insert!(%LocationsTrips{location_id: lake_fork.id, trip_id: trip1.id})
    Repo.insert!(%LocationsTrips{location_id: blue_mesa.id, trip_id: trip1.id})
    Repo.insert!(%LocationsTrips{location_id: main_elk.id, trip_id: trip2.id})
    Repo.insert!(%LocationsTrips{location_id: frying_pan.id, trip_id: trip2.id})
    Repo.insert!(%LocationsTrips{location_id: lake_fork.id, trip_id: trip3.id})
    Repo.insert!(%LocationsTrips{location_id: blue_mesa.id, trip_id: trip3.id})
    Repo.insert!(%LocationsTrips{location_id: main_elk.id, trip_id: trip4.id})
    Repo.insert!(%LocationsTrips{location_id: frying_pan.id, trip_id: trip4.id})
    Repo.insert!(%LocationsTrips{location_id: unamed_pond.id, trip_id: trip4.id})
    Repo.insert!(%LocationsTrips{location_id: white_river.id, trip_id: trip4.id})
    Repo.insert!(%LocationsTrips{location_id: lake_fork.id, trip_id: trip5.id})

    Repo.insert!(%FishermenTrips{fisherman_id: lew.id, trip_id: trip1.id})
    Repo.insert!(%FishermenTrips{fisherman_id: lew.id, trip_id: trip2.id})
    Repo.insert!(%FishermenTrips{fisherman_id: lew.id, trip_id: trip3.id})
    Repo.insert!(%FishermenTrips{fisherman_id: lew.id, trip_id: trip4.id})
    Repo.insert!(%FishermenTrips{fisherman_id: lew.id, trip_id: trip5.id})
    Repo.insert!(%FishermenTrips{fisherman_id: kirk.id, trip_id: trip4.id})
    Repo.insert!(%FishermenTrips{fisherman_id: kirk.id, trip_id: trip5.id})
    Repo.insert!(%FishermenTrips{fisherman_id: joe.id, trip_id: trip1.id})
    Repo.insert!(%FishermenTrips{fisherman_id: joe.id, trip_id: trip5.id})
    Repo.insert!(%FishermenTrips{fisherman_id: mark.id, trip_id: trip1.id})
    Repo.insert!(%FishermenTrips{fisherman_id: mark.id, trip_id: trip2.id})
    Repo.insert!(%FishermenTrips{fisherman_id: mark.id, trip_id: trip3.id})

    # insert lies :-)
    Enum.each(1..1000, fn _ ->
      some_catch = make_random_catch(locations, flies, fish_types)
      Repo.insert!(some_catch)
    end)
  end

  def make_random_catch(locations, fly_types, fish_species) do
    query =
      from(FishermenTrips,
        order_by: fragment("RANDOM()"),
        limit: 1
      )

    fisherman_trip = Repo.all(query) |> hd()
    # fisher = Repo.get_by!(Fishermen, id: fisherman_trip.fisherman_id)
    # should go through LocationsTrips. Bad schema
    location = Enum.random(locations)
    fly_type = Enum.random(fly_types)
    fish_specia = Enum.random(fish_species)

    # random date during trip
    trip = Repo.get_by!(Trips, id: fisherman_trip.trip_id)
    # all trips are 7 days long
    catch_date = Date.add(trip.start_date, :random.uniform(7))
    catch_date_time = NaiveDateTime.new!(catch_date, ~T[11:00:07])

    %FishLanded{
      date_and_time: catch_date_time,
      length: :random.uniform(5),
      weight: :random.uniform(30),
      fisherman_id: fisherman_trip.fisherman_id,
      location_id: location.id,
      fly_type_id: fly_type.id,
      fish_species_id: fish_specia.id
    }
  end
end
