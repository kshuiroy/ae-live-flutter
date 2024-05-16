import 'package:ae_live/config/constants.dart';
import 'package:ae_live/data/enum/wait_time_sort_type.dart';
import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/models/settings_option_model.dart';
import 'package:ae_live/widgets/settings_screen/settings_option_screen_base.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DefaultSortingSettingsScreen extends StatefulWidget {
  const DefaultSortingSettingsScreen({
    super.key,
    this.disableAutoGoBack = false,
  });

  final bool disableAutoGoBack;

  @override
  State<DefaultSortingSettingsScreen> createState() =>
      _DefaultSortingSettingsScreenState();
}

class _DefaultSortingSettingsScreenState
    extends State<DefaultSortingSettingsScreen> {
  WaitTimeSortType? _defaultSorting;
  late SharedPreferences _preferences;

  void _init() async {
    _preferences = await SharedPreferences.getInstance();

    // Get the sorting preference from [SharedPreferences].
    final String? sortingPreference =
        _preferences.getString(Constants.preferenceKeyDefaultSorting);

    // Initialize the default selected option.
    if (sortingPreference == null) {
      setState(() {
        _defaultSorting = WaitTimeSortType.timeInAsd;
      });

      await _preferences.setString(
        Constants.preferenceKeyDefaultSorting,
        waitTimeSortTypeToString(WaitTimeSortType.timeInAsd),
      );
    } else {
      setState(() {
        _defaultSorting = toWaitTimeSortType(sortingPreference);
      });
    }
  }

  Future<void> _onSaveSorting(
      final BuildContext context, final WaitTimeSortType sortType) async {
    // Update the default sorting settings
    await _preferences.setString(
      Constants.preferenceKeyDefaultSorting,
      waitTimeSortTypeToString(sortType),
    );

    // Go back to the last screen
    if (!widget.disableAutoGoBack && context.mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    final Translations t = Translations.of(context);

    final List<SettingsOptionModel<WaitTimeSortType>> sortOptions =
        <SettingsOptionModel<WaitTimeSortType>>[
      SettingsOptionModel(
        title: t.settings.appearance.sorting.options.timeInAsd,
        value: WaitTimeSortType.timeInAsd,
      ),
      SettingsOptionModel(
        title: t.settings.appearance.sorting.options.timeInDesc,
        value: WaitTimeSortType.timeInDesc,
      ),
      SettingsOptionModel(
        title: t.settings.appearance.sorting.options.nameInAsd,
        value: WaitTimeSortType.nameInAsd,
      ),
      SettingsOptionModel(
        title: t.settings.appearance.sorting.options.nameInDesc,
        value: WaitTimeSortType.nameInDesc,
      ),
    ];

    if (_defaultSorting == null) {
      return const SizedBox();
    }

    return SettingsOptionScreenBase<WaitTimeSortType>(
      title: t.settings.appearance.sorting.title,
      options: sortOptions,
      defaultOption: _defaultSorting!,
      onSave: (sortType) => _onSaveSorting(context, sortType),
    );
  }
}
