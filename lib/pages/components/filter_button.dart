import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
    required this.onPressedCallBack,
  });

  final VoidCallback onPressedCallBack;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.tertiary,
        minimumSize: const Size.fromHeight(56),
      ),
      onPressed: onPressedCallBack,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Icon(
              Icons.filter_list,
              color: theme.colorScheme.secondary.withOpacity(0.54),
            ),
          ),
          Align(
            child: Text(
              "ADVANCED FILTERS",
              style: theme.textTheme.headlineSmall?.copyWith(
                fontSize: 14,
                color: theme.colorScheme.primary,
              ),
            ),
          )
        ],
      ),
    );
  }
}
