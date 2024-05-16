import 'package:ae_live/config/clusters.dart';
import 'package:ae_live/config/constants.dart';
import 'package:ae_live/models/cluster_model.dart';
import 'package:ae_live/models/wait_time_model.dart';
import 'package:ae_live/theme/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:responsive_framework/responsive_framework.dart';

class WaitTimeListItem extends StatelessWidget {
  const WaitTimeListItem({
    super.key,
    required this.data,
    this.onTapExpanded,
  });

  final WaitTimeModel data;
  final void Function(WaitTimeModel data)? onTapExpanded;

  String _getClusterText() {
    return clusters
        .firstWhere(
          (final ClusterModel element) =>
              element.clusterCode == data.clusterCode,
        )
        .clusterText;
  }

  Map<String, dynamic> _getCardConfig(final BuildContext context) {
    final CustomColors colorScheme =
        Theme.of(context).extension<CustomColors>()!;

    if (data.waitTimeValue > 0.0 && data.waitTimeValue < 3.0) {
      return <String, dynamic>{
        'containerColor': colorScheme.waitQuickContainer,
        'iconColor': colorScheme.waitQuick,
        'icon': Symbols.keyboard_double_arrow_down_rounded,
      };
    }

    if (data.waitTimeValue >= 3.0 && data.waitTimeValue < 5.0) {
      return <String, dynamic>{
        'containerColor': colorScheme.waitNormalContainer,
        'iconColor': colorScheme.waitNormal,
        'icon': Symbols.keyboard_arrow_down_rounded,
      };
    }

    if (data.waitTimeValue >= 5.0 && data.waitTimeValue < 7.0) {
      return <String, dynamic>{
        'containerColor': colorScheme.waitSlowContainer,
        'iconColor': colorScheme.waitSlow,
        'icon': Symbols.keyboard_arrow_up_rounded,
      };
    }

    return <String, dynamic>{
      'containerColor': colorScheme.waitSlowestContainer,
      'iconColor': colorScheme.waitSlowest,
      'icon': Symbols.keyboard_double_arrow_up_rounded,
    };
  }

  @override
  Widget build(final BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Map<String, dynamic> cardConfig = _getCardConfig(context);

    return Card.filled(
      color: cardConfig['containerColor'],
      margin: EdgeInsets.zero,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          if (ResponsiveBreakpoints.of(context)
                  .largerOrEqualTo(Constants.screenSizeKeyMedium) &&
              onTapExpanded != null) {
            onTapExpanded!(data);
          } else {
            if (onTapExpanded != null) {
              onTapExpanded!(data);
            }

            context.push(
              '/wait-time/details',
              extra: data,
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Icon(
                cardConfig['icon'],
                size: 24.0,
                color: cardConfig['iconColor'],
                fill: 0.0,
                weight: 400.0,
                opticalSize: 24.0,
              ),
              const SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      _getClusterText(),
                      style: textTheme.bodyMedium?.copyWith(
                        color: textTheme.bodyLarge?.color?.withAlpha(160),
                      ),
                    ),
                    Text(
                      data.institutionName,
                      style: textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      data.waitTimeText,
                      style: textTheme.bodyLarge,
                    ),
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
                weight: 400.0,
                opticalSize: 24.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
