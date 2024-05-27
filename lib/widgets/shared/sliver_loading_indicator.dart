import 'package:flutter/material.dart';

class SliverLoadingIndicator extends StatelessWidget {
  const SliverLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom,
        ),
        child: const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}
