import 'dart:io';
import 'dart:ui';

import 'package:ae_live/config/constants.dart';
import 'package:ae_live/config/osm_tile_provider.dart';
import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/utilities/launch_in_app_browser.dart';
import 'package:ae_live/widgets/shared/themed_filled_button_icon.dart';
import 'package:ae_live/widgets/shared/themed_icon.dart';
import 'package:ae_live/widgets/shared/themed_outlined_button_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:responsive_framework/responsive_framework.dart';

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
  final ScrollController _bottomSheetScrollController = ScrollController();

  List<AvailableMap> _installedMaps = [];

  @override
  void initState() {
    super.initState();
    _checkInstalledMaps();
  }

  void _checkInstalledMaps() async {
    final List<AvailableMap> installedMaps = await MapLauncher.installedMaps;

    setState(() {
      _installedMaps = installedMaps;
    });
  }

  Future<void> _onOpenMapsButtonPressed() async {
    /// Open Apple Maps on Apple Platforms.
    ///
    /// For other platforms, open Google Maps if available.
    /// Else, open the first detected installed maps app.
    if (Platform.isIOS || Platform.isMacOS) {
      await MapLauncher.showMarker(
        mapType: MapType.apple,
        coords: Coords(
          widget.latitude,
          widget.longitude,
        ),
        title: widget.institutionName,
      );
    } else if (await MapLauncher.isMapAvailable(MapType.google) ?? false) {
      await MapLauncher.showMarker(
        mapType: MapType.google,
        coords: Coords(
          widget.latitude,
          widget.longitude,
        ),
        title: widget.institutionName,
      );
    } else if (_installedMaps.isNotEmpty) {
      await _installedMaps.first.showMarker(
        coords: Coords(
          widget.latitude,
          widget.longitude,
        ),
        title: widget.institutionName,
      );
    }
  }

  @override
  Widget build(final BuildContext context) {
    final Translations t = Translations.of(context);
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final bool isCompactSize = ResponsiveBreakpoints.of(context)
        .smallerOrEqualTo(Constants.screenSizeKeyCompact);

    return Scaffold(
      appBar: isCompactSize
          ? AppBar(
              backgroundColor: Colors.transparent,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarIconBrightness:
                    Theme.of(context).brightness == Brightness.dark
                        ? Brightness.light
                        : Brightness.dark,
              ),
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
              interactionOptions: const InteractionOptions(
                enableMultiFingerGestureRace: true,
                flags: InteractiveFlag.doubleTapDragZoom |
                    InteractiveFlag.doubleTapZoom |
                    InteractiveFlag.drag |
                    InteractiveFlag.flingAnimation |
                    InteractiveFlag.pinchZoom |
                    InteractiveFlag.rotate |
                    InteractiveFlag.scrollWheelZoom,
                // rotationThreshold: 45.0,
              ),
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
                    child: const ThemedIcon(
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

          // Add a blurred background to the status bar on phone devices for
          // better visibility of the status bar contents.
          if (isCompactSize)
            Align(
              alignment: Alignment.topLeft,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 16.0,
                    sigmaY: 16.0,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).padding.top,
                    color: Theme.of(context).colorScheme.surface.withAlpha(128),
                  ),
                ),
              ),
            ),

          // Build the close button and the OpenStreetMap credit on large-screen
          // devices since there is no [AppBar] on the large-screen devices.
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
      bottomSheet: LayoutBuilder(
        builder: (
          final BuildContext parentContext,
          final BoxConstraints constraints,
        ) {
          return BottomSheet(
            onClosing: () {},
            enableDrag: false,
            showDragHandle: false,
            elevation: 0.0,
            backgroundColor: colorScheme.secondaryContainer,
            constraints: BoxConstraints(
              maxHeight: constraints.maxHeight * 0.4,
            ),
            builder: (final _) {
              return Scrollbar(
                controller: _bottomSheetScrollController,
                child: SingleChildScrollView(
                  controller: _bottomSheetScrollController,
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
                          // maxLines: 3,
                          // overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Row(
                          children: <Widget>[
                            const ThemedIcon(
                              Symbols.location_on_rounded,
                              fill: 1.0,
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
                              child: ThemedFilledButtonIcon(
                                // onPressed: () async {
                                //   await launchUrl(
                                //     MapsLauncher.createCoordinatesUri(
                                //       widget.latitude,
                                //       widget.longitude,
                                //       widget.institutionName,
                                //     ),
                                //     mode: LaunchMode.externalApplication,
                                //   );
                                // },
                                onPressed: _installedMaps.isNotEmpty
                                    ? () async {
                                        await _onOpenMapsButtonPressed();
                                      }
                                    : null,
                                icon: const ThemedIcon(
                                  Symbols.map_rounded,
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
                              child: ThemedOutlinedButtonIcon(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: const ThemedIcon(
                                  Symbols.close_rounded,
                                ),
                                label:
                                    Text(t.shared.facilityMaps.closeMapsModal),
                                style: ButtonStyle(
                                  foregroundColor: WidgetStatePropertyAll(
                                    colorScheme.onSecondaryContainer,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildCloseButton(final BuildContext context) {
    return IconButton.filled(
      color: Colors.black,
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          Colors.white,
        ),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const ThemedIcon(
        Symbols.close_rounded,
      ),
    );
  }

  Widget _buildOSMCredit(
    final BuildContext context,
    final TextTheme textTheme,
  ) {
    return GestureDetector(
      onTap: () async {
        await launchInAppBrowser(Constants.osmCopyright);
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
