import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';

TileLayer get osmTileProvider => TileLayer(
      // List of all tile providers:
      // https://wiki.openstreetmap.org/wiki/Raster_tile_providers
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',

      // Use the recommended flutter_map_cancellable_tile_provider package to
      // support the cancellation of loading tiles.
      tileProvider: CancellableNetworkTileProvider(),
    );
