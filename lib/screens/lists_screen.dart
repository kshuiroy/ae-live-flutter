import 'package:ae_live/config/constants.dart';
import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/widgets/core/frosted_glass_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ListsScreen extends StatefulWidget {
  const ListsScreen({super.key});

  @override
  State<ListsScreen> createState() => _ListsScreenState();
}

class _ListsScreenState extends State<ListsScreen> {
  @override
  Widget build(final BuildContext context) {
    return _buildListsPane(context);
  }

  Widget _buildListsPane(BuildContext context) {
    final Translations t = Translations.of(context);
    final bool isCompact = ResponsiveBreakpoints.of(context)
        .smallerOrEqualTo(Constants.screenSizeKeyCompact);

    final List<_CategoryListItem> categoryList = <_CategoryListItem>[
      _CategoryListItem(
        title: t.lists.categories.hospital,
        icon: Symbols.local_hospital_rounded,
        onTap: () {
          context.push('/facility/hospital');
        },
      ),
      _CategoryListItem(
        title: t.lists.categories.soc,
        icon: Symbols.local_hospital_rounded,
      ),
      _CategoryListItem(
        title: t.lists.categories.goc,
        icon: Symbols.local_hospital_rounded,
      ),
      _CategoryListItem(
        title: t.lists.categories.cmc,
        icon: Symbols.local_hospital_rounded,
      ),
    ];

    return Scaffold(
      appBar: FrostedGlassAppBar(
        title: Text(t.lists.title),
      ),
      extendBodyBehindAppBar: true,
      body: ListView.separated(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + kToolbarHeight + 16.0,
          right: isCompact ? 16.0 : 24.0,
          bottom: 16.0,
          left: isCompact ? 16.0 : 24.0,
        ),
        itemBuilder: (context, index) {
          final _CategoryListItem item = categoryList[index];

          return Card.filled(
            margin: EdgeInsets.zero,
            child: ListTile(
              contentPadding: const EdgeInsets.all(8.0),
              onTap: item.onTap,
              leading: Icon(
                item.icon,
                size: 48.0,
                fill: 0.0,
                weight: 200.0,
                opticalSize: 48.0,
              ),
              title: Text(
                item.title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 16.0,
        ),
        itemCount: categoryList.length,
      ),
    );
  }
}

class _CategoryListItem {
  _CategoryListItem({
    required this.title,
    required this.icon,
    this.onTap,
  });

  final String title;
  final IconData icon;
  final void Function()? onTap;
}
