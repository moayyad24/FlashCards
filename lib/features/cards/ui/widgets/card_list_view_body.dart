import 'package:flutter/material.dart';

class CardListViewBody extends StatelessWidget {
  const CardListViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return const ListTile(
            leading: Icon(Icons.format_line_spacing),
            title: Text('test test'),
            subtitle: Text('for testing purpose'),
          );
        });
  }
}
