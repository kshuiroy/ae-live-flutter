import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/widgets/settings/display_locale_settings.dart';
import 'package:ae_live/widgets/settings/display_theme_settings.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    final List<_SettingsSectionModel> settingsItems = [
      _SettingsSectionModel(
        title: t.settings.sections.appearance,
        items: [
          _SettingsItemModel(
            icon: Symbols.routine_rounded,
            title: t.settings.appearance.theme.title,
            onTap: () {
              showModalBottomSheet(
                context: context,
                enableDrag: false,
                useRootNavigator: true,
                builder: (context) {
                  return const DisplayThemeSettings();
                },
              );
            },
          ),
          _SettingsItemModel(
            icon: Symbols.translate_rounded,
            title: t.settings.appearance.language.title,
            onTap: () {
              showModalBottomSheet(
                context: context,
                enableDrag: false,
                useRootNavigator: true,
                builder: (context) {
                  return const DisplayLocaleSettings();
                },
              );
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
        items: [
          _SettingsItemModel(
            icon: Symbols.delete_rounded,
            title: t.settings.data.reset,
          ),
        ],
      ),
      _SettingsSectionModel(
        title: t.settings.sections.more,
        items: [
          _SettingsItemModel(
            icon: Symbols.code_rounded,
            title: t.settings.more.license,
          ),
          _SettingsItemModel(
            icon: Symbols.smartphone_rounded,
            title: t.settings.more.version,
          ),
        ],
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(t.settings.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: settingsItems
              .asMap()
              .entries
              .map((element) {
                return [
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
                    itemBuilder: (context, index) {
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
                        // trailing: const Icon(
                        //   Symbols.chevron_right_rounded,
                        //   size: 24.0,
                        //   fill: 0.0,
                        //   weight: 200.0,
                        //   opticalSize: 24.0,
                        // ),
                        onTap: item.onTap,
                      );
                    },
                    itemCount: element.value.items.length,
                  ),
                ];
              })
              .expand((element) => element)
              .toList(),
        ),
      ),
    );
  }

  Widget _getSectionTitleWidget(BuildContext context, {required String title}) {
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
