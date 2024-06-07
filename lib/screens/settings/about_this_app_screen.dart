import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/utilities/launch_in_app_browser.dart';
import 'package:ae_live/widgets/core/frosted_glass_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutThisAppScreen extends StatefulWidget {
  const AboutThisAppScreen({super.key});

  @override
  State<AboutThisAppScreen> createState() => _AboutThisAppScreenState();
}

class _AboutThisAppScreenState extends State<AboutThisAppScreen> {
  final ScrollController _screenController = ScrollController();
  String? _appVersion;

  void _init() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();

    setState(() {
      _appVersion = packageInfo.version;
    });
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    final Translations t = Translations.of(context);

    final List<_AboutThisAppTileItem> items = [
      _AboutThisAppTileItem(
        title: t.settings.more.about.items.version,
        value: _appVersion ?? '',
        icon: Symbols.sdk_rounded,
      ),
      _AboutThisAppTileItem(
        title: t.settings.more.about.items.dataSource.title,
        value: t.settings.more.about.items.dataSource.value,
        icon: Symbols.database_rounded,
      ),
      _AboutThisAppTileItem(
        title: t.settings.more.about.items.imageSource.title,
        value: t.settings.more.about.items.imageSource.value,
        icon: Symbols.style_rounded,
        onTap: () async {
          await launchInAppBrowser(t.settings.more.about.items.imageSource.url);
        },
      ),
    ];

    return Scaffold(
      appBar: FrostedGlassAppBar(
        title: Text(
          t.settings.more.about.title,
        ),
      ),
      extendBodyBehindAppBar: true,
      body: _appVersion == null
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : Scrollbar(
              controller: _screenController,
              child: ListView.builder(
                controller: _screenController,
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + kToolbarHeight,
                  bottom: MediaQuery.of(context).padding.bottom + 16.0,
                ),
                itemBuilder: (context, index) {
                  final _AboutThisAppTileItem item = items[index];
                  return ListTile(
                    leading: Icon(
                      item.icon,
                      size: 24.0,
                      fill: 0.0,
                      weight: 200.0,
                      opticalSize: 24.0,
                    ),
                    title: Text(item.title),
                    subtitle: Text(item.value),
                    onTap: item.onTap,
                  );
                },
                itemCount: items.length,
              ),
            ),
    );
  }
}

class _AboutThisAppTileItem {
  _AboutThisAppTileItem({
    required this.title,
    required this.value,
    required this.icon,
    this.onTap,
  });

  final String title;
  final String value;
  final IconData icon;
  final void Function()? onTap;
}
