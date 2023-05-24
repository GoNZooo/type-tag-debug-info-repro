package debug_repro

import "core:fmt"

BackgroundTile :: union {
  TiledFloor,
  Wall,
}

TiledFloor :: struct {}

Wall :: struct {}

map_data: []BackgroundTile = {TiledFloor{}, Wall{}}

main :: proc() {
  for tile, column_index in map_data {
    print_tile(tile)
  }
}

print_tile :: proc(tile: BackgroundTile) {
  // Debug info will state that `tile.tag` is basically some made up value, not `0`
  // In our first iteration it will state this and then move on to `case TiledFloor:`.
  // In our second iteration it will state that we have the exact same tag value and then move on
  // to `case Wall:`.
  switch t in tile {
  case TiledFloor:
    fmt.printf("TiledFloor")
  case Wall:
    fmt.printf("Wall")
  }
}
