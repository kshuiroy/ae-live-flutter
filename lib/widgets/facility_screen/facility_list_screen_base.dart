import 'package:ae_live/widgets/core/controlled_system_ui_container.dart';
import 'package:flutter/material.dart';

class FacilityListScreenBase extends StatefulWidget {
  const FacilityListScreenBase({
    super.key,
    required this.searchFilterHeader,
    required this.body,
  });

  final Widget searchFilterHeader;
  final Widget body;

  @override
  State<FacilityListScreenBase> createState() => _FacilityListScreenBaseState();
}

class _FacilityListScreenBaseState extends State<FacilityListScreenBase> {
  @override
  Widget build(BuildContext context) {
    return ControlledSystemUIContainer(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            widget.searchFilterHeader,
            widget.body,
          ],
        ),
      ),
    );
  }
}
