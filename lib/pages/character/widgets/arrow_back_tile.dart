import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class ArrowBackTile extends StatelessWidget {
  const ArrowBackTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Icon(
        Icons.arrow_back,
      ),
      onTap: () => context.router.back(),
      title: const Text(
        'GO BACK',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
