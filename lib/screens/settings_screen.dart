import 'dart:math';

import 'package:ae_live/config/constants.dart';
import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/screens/settings/about_this_app_screen.dart';
import 'package:ae_live/screens/settings/display_locale_settings_screen.dart';
import 'package:ae_live/screens/settings/display_theme_settings_screen.dart';
import 'package:ae_live/screens/settings/open_source_licenses_screen.dart';
import 'package:ae_live/widgets/core/frosted_glass_app_bar.dart';
import 'package:ae_live/widgets/settings_screen/reset_settings_modal.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Widget? _selectedPane;

  void _showResponsiveModal(final BuildContext context,
      {required final Widget child}) {
    if (ResponsiveBreakpoints.of(context)
        .largerOrEqualTo(Constants.screenSizeKeyMedium)) {
      showDialog(
        context: context,
        useRootNavigator: true,
        builder: (final _) => child,
      );
    } else {
      showModalBottomSheet(
        context: context,
        useRootNavigator: true,
        builder: (final _) => child,
      );
    }
  }

  @override
  Widget build(final BuildContext context) {
    if (ResponsiveBreakpoints.of(context)
        .largerOrEqualTo(Constants.screenSizeKeyMedium)) {
      final bool isMediumSize = ResponsiveBreakpoints.of(context)
          .smallerOrEqualTo(Constants.screenSizeKeyMedium);

      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: isMediumSize ? 1 : 3,
            child: _buildSettingsPane(context),
          ),
          const VerticalDivider(
            width: 1.0,
            thickness: 1.0,
          ),
          Expanded(
            flex: isMediumSize ? 1 : 4,
            child: _selectedPane ?? const SizedBox(),
          ),
        ],
      );
    }

    return LayoutBuilder(
      builder: (final BuildContext context, final BoxConstraints constraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: min(constraints.maxWidth, 560.0),
              ),
              child: _buildSettingsPane(context),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSettingsPane(final BuildContext context) {
    final Translations t = Translations.of(context);
    final bool isCompact = ResponsiveBreakpoints.of(context)
        .smallerOrEqualTo(Constants.screenSizeKeyCompact);

    final List<_SettingsSectionModel> settingsItems = <_SettingsSectionModel>[
      _SettingsSectionModel(
        title: t.settings.sections.appearance,
        items: <_SettingsItemModel>[
          _SettingsItemModel(
            icon: Symbols.routine_rounded,
            title: t.settings.appearance.theme.title,
            onTap: () {
              if (isCompact) {
                context.push('/settings/theme');
              } else {
                setState(() {
                  _selectedPane = const DisplayThemeSettingsScreen(
                    disableAutoGoBack: true,
                  );
                });
              }
            },
          ),
          _SettingsItemModel(
            icon: Symbols.translate_rounded,
            title: t.settings.appearance.language.title,
            onTap: () {
              if (isCompact) {
                context.push('/settings/locale');
              } else {
                setState(() {
                  _selectedPane = const DisplayLocaleSettingsScreen(
                    disableAutoGoBack: true,
                  );
                });
              }
            },
          ),
          _SettingsItemModel(
            icon: Symbols.sort_rounded,
            title: t.settings.appearance.sorting.title,
          ),
        ],
      ),
      _SettingsSectionModel(
        title: t.settings.sections.data,
        items: <_SettingsItemModel>[
          _SettingsItemModel(
            icon: Symbols.delete_rounded,
            title: t.settings.data.reset.title,
            onTap: () {
              _showResponsiveModal(
                context,
                child: const ResetSettingsModal(),
              );
            },
          ),
        ],
      ),
      _SettingsSectionModel(
        title: t.settings.sections.more,
        items: <_SettingsItemModel>[
          _SettingsItemModel(
            icon: Symbols.code_rounded,
            title: t.settings.more.license,
            onTap: () {
              if (isCompact) {
                context.push('/settings/licenses');
              } else {
                setState(() {
                  _selectedPane = const OpenSourceLicensesScreen();
                });
              }
            },
          ),
          _SettingsItemModel(
            icon: Symbols.smartphone_rounded,
            title: t.settings.more.about.title,
            onTap: () {
              if (isCompact) {
                context.push('/settings/about');
              } else {
                setState(() {
                  _selectedPane = const AboutThisAppScreen();
                });
              }
            },
          ),
        ],
      ),
    ];

    return Scaffold(
      appBar: FrostedGlassAppBar(
        title: Text(t.settings.title),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + kToolbarHeight + 16.0,
          bottom: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: settingsItems
              .asMap()
              .entries
              .map((final MapEntry<int, _SettingsSectionModel> element) {
                return <Widget>[
                  if (element.key > 0)
                    const SizedBox(
                      height: 24.0,
                    ),
                  _getSectionTitleWidget(context, title: element.value.title),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(
                      top: 8.0,
                    ),
                    itemBuilder: (final BuildContext context, final int index) {
                      final _SettingsItemModel item =
                          element.value.items[index];

                      return ListTile(
                        // dense: true,
                        leading: Icon(
                          item.icon,
                          size: 24.0,
                          fill: 0.0,
                          weight: 200.0,
                          opticalSize: 24.0,
                        ),
                        title: Text(
                          item.title,
                        ),
                        onTap: item.onTap,
                      );
                    },
                    itemCount: element.value.items.length,
                  ),
                ];
              })
              .expand((final List<Widget> element) => element)
              .toList(),
        ),
      ),
    );
  }

  Widget _getSectionTitleWidget(final BuildContext context,
      {required final String title}) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: Text(
        title,
        style: textTheme.titleSmall,
      ),
    );
  }
}

class _SettingsSectionModel {
  _SettingsSectionModel({
    required this.title,
    required this.items,
  });

  final String title;
  final List<_SettingsItemModel> items;
}

class _SettingsItemModel {
  _SettingsItemModel({
    required this.icon,
    required this.title,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final void Function()? onTap;
}
