import 'package:flutter/material.dart';

class ListTileItem extends StatelessWidget {
  const ListTileItem({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle != '' ? subtitle : 'Unknown'),
    );
  }
}
