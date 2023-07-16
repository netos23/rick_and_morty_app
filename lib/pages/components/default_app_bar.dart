import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return AppBar(
      backgroundColor: theme.colorScheme.background,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_rounded,
          color: theme.colorScheme.secondary,
        ),
        onPressed: () {
          AutoRouter.of(context).pop();
        },
      ),
    );
  }
}
