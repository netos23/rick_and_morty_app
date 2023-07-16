import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

typedef Redirect = void Function(BuildContext, AutoRoute);

class InformationListTile extends StatelessWidget {
  const InformationListTile(
      {super.key,
      required this.title,
      required this.subtitle,
      this.redirectCallBack,
      this.trailing});

  final String title;
  final String subtitle;
  final Redirect? redirectCallBack;
  final String? trailing;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ListTile(
      isThreeLine: trailing != null,
      trailing: Text(
        trailing ?? '',
        style: theme.textTheme.bodySmall,
      ),
      title: Text(
        title,
        style: theme.textTheme.bodyLarge,
      ),
      subtitle: Text(
        subtitle,
        style: theme.textTheme.bodySmall,
      ),
    );
  }
}
