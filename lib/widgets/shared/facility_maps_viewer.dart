import 'package:ae_live/config/constants.dart';
import 'package:ae_live/config/osm_tile_provider.dart';
import 'package:ae_live/i18n/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

class FacilityMapsViewer extends StatefulWidget {
  const FacilityMapsViewer({
    super.key,
    required this.institutionName,
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  final String institutionName;
  final String address;
  final double latitude;
  final double longitude;

  @override
  State<FacilityMapsViewer> createState() => _FacilityMapsViewerState();
}

class _FacilityMapsViewerState extends State<FacilityMapsViewer> {
  @override
  Widget build(final BuildContext context) {
    final Translations t = Translations.of(context);
    final TextTheme textTheme = Theme.of(context).textTheme;
    final bool isCompactSize = ResponsiveBreakpoints.of(context)
        .smallerOrEqualTo(Constants.screenSizeKeyCompact);

    return Scaffold(
      appBar: isCompactSize
          ? AppBar(
              backgroundColor: Colors.transparent,
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              leading: _buildCloseButton(context),
              actions: <Widget>[
                _buildOSMCredit(context, textTheme),
                const SizedBox(
                  width: 8.0,
                ),
              ],
            )
          : null,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              // Move the camera a little bit downward to avoid the marker might be
              // placed below the bottom sheet at some situations.
              initialCenter: LatLng(widget.latitude - 0.001, widget.longitude),
              initialZoom: 17.0,
            ),
            children: <Widget>[
              osmTileProvider,
              MarkerLayer(
                markers: <Marker>[
                  Marker(
                    point: LatLng(widget.latitude, widget.longitude),
                    width: 48.0,
                    height: 48.0,
                    // alignment: Alignment.center,
                    child: const Icon(
                      Symbols.location_on,
                      size: 48.0,
                      fill: 1.0,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (!isCompactSize)
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: _buildCloseButton(context),
                    ),
                    Flexible(
                      child: _buildOSMCredit(context, textTheme),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
      bottomSheet: BottomSheet(
        onClosing: () {},
        enableDrag: false,
        showDragHandle: false,
        elevation: 0.0,
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        builder: (final _) {
          return Padding(
            padding: EdgeInsets.only(
              top: 24.0,
              right: isCompactSize ? 16.0 : 24.0,
              bottom: isCompactSize
                  ? MediaQuery.of(context).padding.bottom + 16.0
                  : 16.0,
              left: isCompactSize ? 16.0 : 24.0,
            ),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    widget.institutionName,
                    style: textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    children: <Widget>[
                      const Icon(
                        Symbols.location_on_rounded,
                        size: 24.0,
                        fill: 1.0,
                        weight: 200.0,
                        opticalSize: 24.0,
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        child: Text(
                          widget.address,
                          style: textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: FilledButton.icon(
                          onPressed: () async {
                            await launchUrl(
                              MapsLauncher.createCoordinatesUri(
                                widget.latitude,
                                widget.longitude,
                                widget.institutionName,
                              ),
                              mode: LaunchMode.externalApplication,
                            );
                          },
                          icon: const Icon(
                            Symbols.map_rounded,
                            fill: 0.0,
                            weight: 200.0,
                            opticalSize: 24.0,
                          ),
                          label: Text(t.shared.facilityMaps.openMapsApp),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Symbols.close_rounded,
                            fill: 0.0,
                            weight: 200.0,
                            opticalSize: 24.0,
                          ),
                          label: Text(t.shared.facilityMaps.closeMapsModal),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCloseButton(final BuildContext context) {
    return IconButton.filled(
      color: Colors.black,
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          Colors.white,
        ),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(
        Symbols.close_rounded,
        weight: 200.0,
        opticalSize: 24.0,
      ),
    );
  }

  Widget _buildOSMCredit(
    final BuildContext context,
    final TextTheme textTheme,
  ) {
    return GestureDetector(
      onTap: () async {
        launchUrl(
          Uri.parse('https://openstreetmap.org/copyright'),
          mode: LaunchMode.inAppBrowserView,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: RichText(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
            text: '\u00a9 ',
            style: textTheme.bodySmall?.copyWith(
              color: Colors.black,
            ),
            children: const <InlineSpan>[
              TextSpan(
                text: 'OpenStreetMap contributors',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
