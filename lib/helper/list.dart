import 'package:flutter/material.dart';

// A widget that displays a list of items using a ListView.
class ItemListWidget extends StatelessWidget {
  final List<String> items;

  const ItemListWidget({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    // Uses an Expanded widget to allow the ListView to fill the available space.
    return Expanded(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]), // Displays the item text.
          );
        },
      ),
    );
  }
}
