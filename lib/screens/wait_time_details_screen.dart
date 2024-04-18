import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/models/wait_time_history_model.dart';
import 'package:ae_live/models/wait_time_model.dart';
import 'package:ae_live/widgets/wait_time_details/hospital_info_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WaitTimeDetailsScreen extends StatefulWidget {
  const WaitTimeDetailsScreen({
    super.key,
    required this.data,
  });

  final WaitTimeModel data;

  @override
  State<WaitTimeDetailsScreen> createState() => _WaitTimeDetailsScreenState();
}

class _WaitTimeDetailsScreenState extends State<WaitTimeDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.data.institutionName,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 16.0,
          right: 16.0,
          bottom: MediaQuery.of(context).padding.bottom + 16.0,
          left: 16.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    t.waitTimeDetails.expectedWaitTime,
                    style: textTheme.bodyLarge?.copyWith(
                      color: textTheme.bodyLarge?.color?.withAlpha(160),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    widget.data.waitTimeText,
                    style: textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Symbols.call_rounded,
                      fill: 0.0,
                      weight: 200.0,
                      opticalSize: 24.0,
                    ),
                    label: Text(
                      t.waitTimeDetails.actions.call,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Symbols.location_on_rounded,
                      fill: 0.0,
                      weight: 200.0,
                      opticalSize: 24.0,
                    ),
                    label: Text(
                      t.waitTimeDetails.actions.maps,
                    ),
                  ),
                ),
              ],
            ),
            // const SizedBox(
            //   height: 24.0,
            // ),
            SizedBox(
              height: 280.0,
              child: _buildHistoryChart(context),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Text(
              t.waitTimeDetails.info.title,
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            HospitalInfoItem(
              title: t.waitTimeDetails.info.address,
              value: widget.data.address,
              icon: Symbols.location_on_rounded,
            ),
            HospitalInfoItem(
              title: t.waitTimeDetails.info.contactNo,
              value: widget.data.contactNo,
              icon: Symbols.call_rounded,
            ),
            if (widget.data.faxNo != null)
              HospitalInfoItem(
                title: t.waitTimeDetails.info.faxNo,
                value: widget.data.faxNo!,
                icon: Symbols.fax_rounded,
              ),
            if (widget.data.emailAddress != null)
              HospitalInfoItem(
                title: t.waitTimeDetails.info.emailAddress,
                value: widget.data.emailAddress!,
                icon: Symbols.mail_rounded,
              ),
            if (widget.data.website != null)
              HospitalInfoItem(
                title: t.waitTimeDetails.info.website,
                value: widget.data.website!,
                icon: Symbols.public_rounded,
              ),
          ],
        ),
      ),
    );
  }

  SfCartesianChart _buildHistoryChart(BuildContext context) {
    final t = Translations.of(context);
    final TextTheme textTheme = Theme.of(context).textTheme;

    return SfCartesianChart(
      plotAreaBorderWidth: 0.0,
      title: ChartTitle(
        text: t.waitTimeDetails.chartTitle,
        textStyle: textTheme.bodyMedium?.copyWith(
          color: textTheme.bodyLarge?.color?.withAlpha(160),
        ),
      ),
      legend: const Legend(
        isVisible: false,
      ),
      primaryXAxis: DateTimeAxis(
        edgeLabelPlacement: EdgeLabelPlacement.shift,
        dateFormat: DateFormat('HH:mm'),
        intervalType: DateTimeIntervalType.hours,
        interval: 1.0,
      ),
      primaryYAxis: NumericAxis(
        labelFormat: t.waitTimeDetails.hours,
        minimum: 0.0,
        maximum: 9.0,
        interval: 2.0,
        majorGridLines: const MajorGridLines(
          color: Colors.transparent,
        ),
      ),
      series: _getChartSeries(
        lineColor: Theme.of(context).colorScheme.primary,
      ),
      trackballBehavior: _getChartTrackballBehavior(context),
    );
  }

  List<LineSeries<WaitTimeHistoryModel, DateTime>> _getChartSeries({
    required Color lineColor,
  }) {
    return <LineSeries<WaitTimeHistoryModel, DateTime>>[
      LineSeries<WaitTimeHistoryModel, DateTime>(
        dataSource: widget.data.waitTimeHistory,
        xValueMapper: (item, _) => item.timestamp,
        yValueMapper: (item, _) => item.waitTimeValue,
        width: 4.0,
        color: lineColor,
        animationDuration: 500,
      ),
    ];
  }

  TrackballBehavior _getChartTrackballBehavior(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return TrackballBehavior(
      enable: true,
      markerSettings: TrackballMarkerSettings(
        height: 8.0,
        width: 8.0,
        borderWidth: 2.0,
        borderColor: colorScheme.primary,
      ),
      hideDelay: 2000.0,
      activationMode: ActivationMode.singleTap,
      tooltipDisplayMode: TrackballDisplayMode.floatAllPoints,
      tooltipSettings: InteractiveTooltip(
        color: colorScheme.primaryContainer,
        borderColor: Colors.transparent,
        arrowWidth: 8.0,
        arrowLength: 16.0,
      ),
      builder: (BuildContext context, TrackballDetails trackballDetails) {
        final WaitTimeHistoryModel historyItem =
            widget.data.waitTimeHistory![trackballDetails.pointIndex!];

        return _chartTooltipWidget(
          context,
          timestamp: historyItem.timestamp,
          waitTimeText: historyItem.waitTimeText,
        );
      },
    );
  }

  Widget _chartTooltipWidget(
    BuildContext context, {
    required DateTime timestamp,
    String? waitTimeText,
  }) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      width: 176.0,
      height: 80.0,
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            DateFormat('yyyy-MM-dd HH:mm').format(timestamp),
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onPrimaryContainer,
            ),
          ),
          Divider(
            color: colorScheme.outline,
          ),
          Text(
            waitTimeText ?? 'Unknown',
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onPrimaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}
