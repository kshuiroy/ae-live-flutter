import 'package:flutter/material.dart';

class FacilityLoadingIndicator extends StatelessWidget {
  const FacilityLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom,
      ),
      child: const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
