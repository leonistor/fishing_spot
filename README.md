# FishingSpot

Good though old (ecto v2!) Ecto tutorial.

https://www.glydergun.com/diving-into-ecto/

https://www.glydergun.com/diving-into-ecto-part-2/

## Generate migrations from `migrations_list.txt`

`xargs -p -L 1 mix ecto.gen.migration < migrations_list.txt`

* `-p`: prompt before execute (correct timestamp for migration). Only
              run the command line if the response starts with `y` or `Y`.
* `-L 1`: Use at most max-lines nonblank input lines per command line.

## .iex.exs

Project-only aliases and functions.
