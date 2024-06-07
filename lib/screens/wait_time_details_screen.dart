import 'dart:math';

import 'package:ae_live/config/constants.dart';
import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/models/wait_time_history_model.dart';
import 'package:ae_live/models/wait_time_model.dart';
import 'package:ae_live/utilities/platform_helper.dart';
import 'package:ae_live/widgets/core/frosted_glass_app_bar.dart';
import 'package:ae_live/widgets/core/responsive_dialog.dart';
import 'package:ae_live/widgets/shared/facility_maps_viewer.dart';
import 'package:ae_live/widgets/shared/wait_time_data_remarks.dart';
import 'package:ae_live/widgets/wait_time_details/hospital_info_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:url_launcher/url_launcher.dart';

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
  final ScrollController _screenController = ScrollController();

  bool _isLoading = true;
  bool _isPhoneCallSupported = false;
  bool _isEmailSupported = false;

  void _init() async {
    final bool checkCanMakePhoneCall = await canLaunchUrl(
      Uri(
        scheme: 'tel',
        path: widget.data.contactNo,
      ),
    );

    final bool checkCanSendEmail = await canLaunchUrl(
      Uri(
        scheme: 'mailto',
        path: widget.data.emailAddress ?? '',
      ),
    );

    setState(() {
      _isLoading = false;
      _isPhoneCallSupported = checkCanMakePhoneCall;
      _isEmailSupported = checkCanSendEmail;
    });

    // debugPrint('Can make phone call: $_canMakePhoneCall');
  }

  void _showHospitalMap(final BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      pageBuilder: (
        final BuildContext innerContext,
        final Animation<double> animation,
        final Animation<double> secondaryAnimation,
      ) {
        if (ResponsiveBreakpoints.of(context)
            .largerOrEqualTo(Constants.screenSizeKeyMedium)) {
          return ResponsiveDialog(
            child: LayoutBuilder(
              builder: (
                final BuildContext context,
                final BoxConstraints constrains,
              ) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      24.0,
                    ),
                  ),
                  height: min(constrains.maxHeight - 48.0, 800.0),
                  clipBehavior: Clip.hardEdge,
                  child: FacilityMapsViewer(
                    institutionName: widget.data.institutionName,
                    address: widget.data.address,
                    latitude: widget.data.latitude,
                    longitude: widget.data.longitude,
                  ),
                );
              },
            ),
          );
        }

        return FacilityMapsViewer(
          institutionName: widget.data.institutionName,
          address: widget.data.address,
          latitude: widget.data.latitude,
          longitude: widget.data.longitude,
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

  void _shareHospitalInfo(final BuildContext context) {
    final Translations t = Translations.of(context);

    String content = t.waitTimeDetails.shareContent.base(
      hospitalName: widget.data.institutionName,
      waitingTime: widget.data.waitTimeText,
      address: widget.data.address,
      contactNo: widget.data.contactNo,
    );

    if (widget.data.faxNo != null) {
      content += t.waitTimeDetails.shareContent.faxNo(
        faxNo: widget.data.faxNo!,
      );
    }

    if (widget.data.emailAddress != null) {
      content += t.waitTimeDetails.shareContent.emailAddress(
        emailAddress: widget.data.emailAddress!,
      );
    }

    if (widget.data.website != null) {
      content += t.waitTimeDetails.shareContent.website(
        website: widget.data.website!,
      );
    }

    Share.share(content);
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(final BuildContext context) {
    final Translations t = Translations.of(context);
    final TextTheme textTheme = Theme.of(context).textTheme;
    final double screenPaddingX = ResponsiveBreakpoints.of(context)
            .largerOrEqualTo(Constants.screenSizeKeyMedium)
        ? 24.0
        : 16.0;

    return Scaffold(
      appBar: FrostedGlassAppBar(
        title: Text(
          widget.data.institutionName,
        ),
        actions: [
          IconButton(
            tooltip: t.waitTimeDetails.actions.share,
            onPressed: () => _shareHospitalInfo(context),
            icon: PlatformHelper.isApplePlatform
                ? Icon(
                    CupertinoIcons.share,
                  )
                : Icon(
                    Symbols.share_rounded,
                    fill: 0.0,
                    weight: 200.0,
                    opticalSize: 24.0,
                  ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : Scrollbar(
              controller: _screenController,
              child: SingleChildScrollView(
                controller: _screenController,
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + kToolbarHeight,
                  // right: screenPaddingX,
                  bottom: MediaQuery.of(context).padding.bottom + 16.0,
                  // left: screenPaddingX,
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenPaddingX,
                        vertical: 16.0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  t.waitTimeDetails.estimatedWaitTime,
                                  style: textTheme.bodyLarge?.copyWith(
                                    color: textTheme.bodyLarge?.color
                                        ?.withAlpha(160),
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
                            children: <Widget>[
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
                            height: 16.0,
                          ),
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 560.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: FilledButton.icon(
                                    onPressed: _isPhoneCallSupported
                                        ? () async {
                                            if (_isPhoneCallSupported) {
                                              await launchUrl(
                                                Uri(
                                                  scheme: 'tel',
                                                  path: widget.data.contactNo,
                                                ),
                                              );
                                            }
                                          }
                                        : null,
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
                                  child: FilledButton.icon(
                                    onPressed: () {
                                      _showHospitalMap(context);
                                    },
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
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          SizedBox(
                            height: ResponsiveBreakpoints.of(context)
                                    .largerOrEqualTo(
                              Constants.screenSizeKeyMedium,
                            )
                                ? 320.0
                                : 280.0,
                            child: _buildHistoryChart(context),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                        ],
                      ),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 608.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenPaddingX,
                            ),
                            child: Text(
                              t.waitTimeDetails.info.title,
                              style: textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          HospitalInfoItem(
                            title: t.waitTimeDetails.info.address,
                            value: widget.data.address,
                            icon: Symbols.location_on_rounded,
                            onTap: () => _showHospitalMap(context),
                          ),
                          HospitalInfoItem(
                            title: t.waitTimeDetails.info.contactNo,
                            value: widget.data.contactNo,
                            icon: Symbols.call_rounded,
                            onTap: _isPhoneCallSupported
                                ? () async {
                                    await launchUrl(
                                      Uri(
                                        scheme: 'tel',
                                        path: widget.data.contactNo
                                            .replaceAll(' ', ''),
                                      ),
                                    );
                                  }
                                : null,
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
                              onTap: _isEmailSupported
                                  ? () async {
                                      await launchUrl(
                                        Uri(
                                          scheme: 'mailto',
                                          path: widget.data.emailAddress,
                                        ),
                                      );
                                    }
                                  : null,
                            ),
                          if (widget.data.website != null)
                            HospitalInfoItem(
                              title: t.waitTimeDetails.info.website,
                              value: widget.data.website!,
                              icon: Symbols.public_rounded,
                              onTap: () async {
                                await launchUrl(
                                  Uri.parse(widget.data.website!),
                                  mode: LaunchMode.inAppBrowserView,
                                );
                              },
                            ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                              screenPaddingX,
                              24.0,
                              screenPaddingX,
                              0.0,
                            ),
                            child: const WaitTimeDataRemarks(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  SfCartesianChart _buildHistoryChart(final BuildContext context) {
    final Translations t = Translations.of(context);
    final TextTheme textTheme = Theme.of(context).textTheme;

    return SfCartesianChart(
      plotAreaBorderWidth: 0.0,
      title: ChartTitle(
        text: t.waitTimeDetails.chartTitle,
        textStyle: textTheme.bodyMedium?.copyWith(
          color: textTheme.bodyLarge?.color?.withAlpha(160),
        ),
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
    required final Color lineColor,
  }) {
    return <LineSeries<WaitTimeHistoryModel, DateTime>>[
      LineSeries<WaitTimeHistoryModel, DateTime>(
        dataSource: widget.data.waitTimeHistory,
        xValueMapper: (final WaitTimeHistoryModel item, final _) =>
            item.timestamp,
        yValueMapper: (final WaitTimeHistoryModel item, final _) =>
            item.waitTimeValue,
        width: 4.0,
        color: lineColor,
        animationDuration: 500,
      ),
    ];
  }

  TrackballBehavior _getChartTrackballBehavior(final BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return TrackballBehavior(
      enable: true,
      markerSettings: TrackballMarkerSettings(
        borderColor: colorScheme.primary,
      ),
      hideDelay: 2000.0,
      activationMode: ActivationMode.singleTap,
      tooltipSettings: InteractiveTooltip(
        color: colorScheme.primaryContainer,
        borderColor: Colors.transparent,
        arrowWidth: 8.0,
        arrowLength: 16.0,
      ),
      builder: (
        final BuildContext context,
        final TrackballDetails trackballDetails,
      ) {
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
    final BuildContext context, {
    required final DateTime timestamp,
    final String? waitTimeText,
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
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
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
