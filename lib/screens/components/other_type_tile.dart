import 'package:flutter/material.dart';

class OtherTypeTile extends StatelessWidget {
  const OtherTypeTile({Key? key, required this.name, this.onTap}) : super(key: key);
final String name;
final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      trailing: const Icon(Icons.navigate_next),
      onTap: onTap,
    );
  }
}
