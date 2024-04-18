import 'package:ae_live/config/clusters.dart';
import 'package:ae_live/config/constants.dart';
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
        .firstWhere((element) => element.clusterCode == data.clusterCode)
        .clusterText;
  }

  Map<String, dynamic> _getCardConfig(BuildContext context) {
    final CustomColors colorScheme =
        Theme.of(context).extension<CustomColors>()!;

    if (data.waitTimeValue > 0.0 && data.waitTimeValue < 3.0) {
      return {
        'containerColor': colorScheme.waitQuickContainer,
        'iconColor': colorScheme.waitQuick,
        'icon': Symbols.keyboard_double_arrow_down_rounded,
      };
    }

    if (data.waitTimeValue >= 3.0 && data.waitTimeValue < 5.0) {
      return {
        'containerColor': colorScheme.waitNormalContainer,
        'iconColor': colorScheme.waitNormal,
        'icon': Symbols.keyboard_arrow_down_rounded,
      };
    }

    if (data.waitTimeValue >= 5.0 && data.waitTimeValue < 7.0) {
      return {
        'containerColor': colorScheme.waitSlowContainer,
        'iconColor': colorScheme.waitSlow,
        'icon': Symbols.keyboard_arrow_up_rounded,
      };
    }

    return {
      'containerColor': colorScheme.waitSlowestContainer,
      'iconColor': colorScheme.waitSlowest,
      'icon': Symbols.keyboard_double_arrow_up_rounded,
    };
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Map<String, dynamic> cardConfig = _getCardConfig(context);

    return Card(
      color: cardConfig['containerColor'],
      elevation: 0.0,
      margin: EdgeInsets.zero,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          if (ResponsiveBreakpoints.of(context)
                  .largerOrEqualTo(Constants.screenSizeKeyExpanded) &&
              onTapExpanded != null) {
            onTapExpanded!(data);
          } else {
            context.push(
              '/wait-time/details',
              extra: data,
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
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
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //     const Icon(
                    //       Symbols.location_on_rounded,
                    //       size: 20.0,
                    //       fill: 0.0,
                    //       weight: 200.0,
                    //       opticalSize: 20.0,
                    //     ),
                    //     const SizedBox(
                    //       width: 8.0,
                    //     ),
                    //     Expanded(
                    //       child: Text(
                    //         data.address,
                    //         style: textTheme.bodyMedium,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //     const Icon(
                    //       Symbols.call_rounded,
                    //       size: 20.0,
                    //       fill: 0.0,
                    //       weight: 200.0,
                    //       opticalSize: 20.0,
                    //     ),
                    //     const SizedBox(
                    //       width: 8.0,
                    //     ),
                    //     Expanded(
                    //       child: Text(
                    //         data.contactNo,
                    //         style: textTheme.bodyMedium,
                    //       ),
                    //     ),
                    //   ],
                    // ),
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
