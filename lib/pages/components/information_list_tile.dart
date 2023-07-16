import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class InformationListTile extends StatelessWidget {
  const InformationListTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.redirectCallBack,
  });

  final String title;
  final String subtitle;
  final VoidCallback? redirectCallBack;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ListTile(
      trailing: redirectCallBack != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 20,
                  ),
                  onPressed: redirectCallBack,
                ),
              ],
            )
          : null,
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
