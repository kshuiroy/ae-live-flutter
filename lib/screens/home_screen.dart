import 'package:ae_live/bloc/wait_time/wait_time_bloc.dart';
import 'package:ae_live/config/constants.dart';
import 'package:ae_live/data/enum/wait_time_sort_type.dart';
import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/models/wait_time_model.dart';
import 'package:ae_live/screens/wait_time_details_screen.dart';
import 'package:ae_live/widgets/wait_time/wait_time_list_item.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late EasyRefreshController _refreshController;
  WaitTimeModel? _selectedWaitTime;

  @override
  void initState() {
    super.initState();
    // context.read<WaitTimeBloc>().add(WaitTimeFetchRequested());
    _refreshController = EasyRefreshController(
      controlFinishLoad: true,
      controlFinishRefresh: true,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _refreshController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (ResponsiveBreakpoints.of(context)
        .largerOrEqualTo(Constants.screenSizeKeyExpanded)) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: _getWaitTimeListPane(context),
          ),
          const VerticalDivider(),
          Expanded(
            flex: 4,
            child: _selectedWaitTime != null
                ? WaitTimeDetailsScreen(
                    data: _selectedWaitTime!,
                  )
                : const SizedBox(),
          ),
        ],
      );
    }

    return _getWaitTimeListPane(context);
  }

  Widget _getWaitTimeListPane(BuildContext context) {
    final t = Translations.of(context);

    return BlocBuilder<WaitTimeBloc, WaitTimeState>(
      builder: (context, state) {
        if (state is WaitTimeInitial) {
          context.read<WaitTimeBloc>().add(WaitTimeFetchRequested());
        }

        if (state is WaitTimeFailed) {
          return Center(
            child: Text(
              state.errorMessage,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          );
        }

        if (state is! WaitTimeSuccess) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }

        return SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveBreakpoints.of(context)
                          .largerOrEqualTo(Constants.screenSizeKeyMedium)
                      ? 24.0
                      : 16.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.read<WaitTimeBloc>().add(
                              WaitTimeDataFilter(name: 'ch'),
                            );
                      },
                      child: const Text('Name'),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<WaitTimeBloc>().add(
                              WaitTimeDataFilter(clusters: const [1, 2, 7]),
                            );
                      },
                      child: const Text('Clusters'),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<WaitTimeBloc>().add(
                              WaitTimeDataFilter(
                                  sortType: WaitTimeSortType.nameInDesc),
                            );
                      },
                      child: const Text('Sort'),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<WaitTimeBloc>()
                            .add(WaitTimeFetchRequested());
                      },
                      child: const Text('Refresh'),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<WaitTimeBloc>().add(
                              WaitTimeDataFilter(),
                            );
                      },
                      child: const Text('Reset'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: EasyRefresh(
                  clipBehavior: Clip.none,
                  controller: _refreshController,
                  header: ClassicHeader(
                    dragText: t.home.refreshIndicator.pullToRefresh,
                    armedText: t.home.refreshIndicator.releaseToRefresh,
                    readyText: t.home.refreshIndicator.refreshing,
                    processingText: t.home.refreshIndicator.refreshing,
                    processedText: t.home.refreshIndicator.dataUpdated,
                    failedText: t.home.refreshIndicator.failedToRefresh,
                    messageText: t.home.refreshIndicator.lastUpdateAt,
                  ),
                  onRefresh: () {
                    context.read<WaitTimeBloc>().add(WaitTimeFetchRequested());
                    _refreshController.finishRefresh();
                  },
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16.0),
                    itemBuilder: (context, index) {
                      if (index == state.waitTimeData.length) {
                        return Text.rich(
                          t.main.dataRemarks.content(
                            tapPCD: (text) => TextSpan(
                                text: text,
                                style: const TextStyle(
                                  color: Colors.blue,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    debugPrint('Tapped "$text"');
                                  }),
                            tapHKD: (text) => TextSpan(
                                text: text,
                                style: const TextStyle(
                                  color: Colors.blue,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    debugPrint('Tapped "$text"');
                                  }),
                          ),
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.color
                                        ?.withAlpha(160),
                                  ),
                        );
                      }
                      return WaitTimeListItem(
                        data: state.waitTimeData[index],
                        onTapExpanded: (data) {
                          setState(() {
                            _selectedWaitTime = data;
                          });
                        },
                      );
                    },
                    separatorBuilder: (_, __) {
                      return const SizedBox(
                        height: 16.0,
                      );
                    },
                    itemCount: state.waitTimeData.length + 1,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
