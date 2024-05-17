import 'package:ae_live/config/clusters.dart';
import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/models/cluster_model.dart';
import 'package:ae_live/theme/custom_colors.dart';
import 'package:ae_live/widgets/shared/facility_maps_viewer.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class FacilityItemCard extends StatelessWidget {
  const FacilityItemCard({
    super.key,
    required this.institutionName,
    required this.address,
    this.clusterCode,
    this.withAEService,
    required this.latitude,
    required this.longitude,
  });

  final String institutionName;
  final String address;
  final int? clusterCode;
  final bool? withAEService;
  final double latitude;
  final double longitude;

  String _getClusterText() {
    return clusters
        .firstWhere(
          (final ClusterModel element) => element.clusterCode == clusterCode,
        )
        .clusterText;
  }

  void _showFacilityMap(final BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      pageBuilder: (
        final BuildContext context,
        final Animation<double> animation,
        final Animation<double> secondaryAnimation,
      ) {
        return FacilityMapsViewer(
          institutionName: institutionName,
          address: address,
          latitude: latitude,
          longitude: longitude,
        );
      },
      transitionBuilder: (
        final BuildContext context,
        final Animation<double> animation,
        final Animation<double> secondaryAnimation,
        final Widget child,
      ) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, 1.0),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutQuart,
            ),
          ),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Translations t = Translations.of(context);
    final CustomColors colorScheme =
        Theme.of(context).extension<CustomColors>()!;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Card.filled(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => _showFacilityMap(context),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      institutionName,
                      style: textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (clusterCode != null) ...[
                      const SizedBox(
                        height: 4.0,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Symbols.public_rounded,
                            size: 24.0,
                            fill: 0.0,
                            weight: 200.0,
                            opticalSize: 24.0,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Expanded(
                            child: Text(
                              _getClusterText(),
                              style: textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ],
                    const SizedBox(
                      height: 4.0,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Symbols.location_on_rounded,
                          size: 24.0,
                          fill: 0.0,
                          weight: 200.0,
                          opticalSize: 24.0,
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Expanded(
                          child: Text(
                            address,
                            style: textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                    if (withAEService != null) ...[
                      const SizedBox(
                        height: 4.0,
                      ),
                      Row(
                        children: [
                          Icon(
                            withAEService!
                                ? Symbols.check_circle_rounded
                                : Symbols.cancel_rounded,
                            color: withAEService!
                                ? colorScheme.waitQuick
                                : colorScheme.waitSlowest,
                            size: 24.0,
                            fill: 0.0,
                            weight: 200.0,
                            opticalSize: 24.0,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Expanded(
                            child: Text(
                              withAEService!
                                  ? t.lists.hospital.withAEService
                                  : t.lists.hospital.withoutAEService,
                              style: textTheme.bodyMedium?.copyWith(
                                color: withAEService!
                                    ? colorScheme.waitQuick
                                    : colorScheme.waitSlowest,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              const Icon(
                Symbols.chevron_right_rounded,
                size: 24.0,
                fill: 0.0,
                weight: 200.0,
                opticalSize: 24.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
