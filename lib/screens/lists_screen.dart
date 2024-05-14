import 'package:flutter/material.dart';

class ListsScreen extends StatefulWidget {
  const ListsScreen({super.key});

  @override
  State<ListsScreen> createState() => _ListsScreenState();
}

class _ListsScreenState extends State<ListsScreen> {
  @override
  Widget build(final BuildContext context) {
    return const Center(
      child: Text('Lists'),
    );
  }
}
