
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.text, required this.buttonHeight,
  });

  final VoidCallback? onTap;
  final String text;
  final double buttonHeight;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      height: buttonHeight,
      child: FilledButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(colorScheme.onBackground),
        ),
        onPressed: onTap,
        child: Center(
          child: Text(
            text,
            style: textTheme.headlineSmall,
          ),
        ),
      ),
    );
  }
}
