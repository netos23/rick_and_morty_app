import 'package:flutter/material.dart';

class ArrowBackTile extends StatelessWidget {
  const ArrowBackTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Icon(
        Icons.arrow_back,
      ),
      onTap: () => Navigator.of(context).pop(),
      title: const Text(
        'GO BACK',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
