import 'package:flutter/material.dart';

class FilterTextForm extends StatelessWidget {
  const FilterTextForm({
    super.key,
    required this.onFieldSubmitted,
  });

  final ValueChanged<String> onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      decoration: const InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: 'Fitler by name...',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)))),
    );
  }
}
