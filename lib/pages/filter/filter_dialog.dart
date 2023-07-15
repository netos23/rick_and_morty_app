import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/pages/filter/filter_dto.dart';


class FilterDialog extends StatefulWidget {
  const FilterDialog({Key? key}) : super(key: key);

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  String species = '';
  String gender = '';
  String status = '';

  final List<DropdownMenuEntry<String>> speciesEntries =
      <DropdownMenuEntry<String>>[
    const DropdownMenuEntry(value: 'human', label: 'Human'),
    const DropdownMenuEntry(value: 'unknown', label: 'Unknown'),
  ];

  final List<DropdownMenuEntry<String>> statusEntries =
      <DropdownMenuEntry<String>>[
    const DropdownMenuEntry(value: 'alive', label: 'Alive'),
    const DropdownMenuEntry(value: 'dead', label: 'Dead'),
    const DropdownMenuEntry(value: 'unknown', label: 'Unknown'),
  ];

  final List<DropdownMenuEntry<String>> genderEntries =
      <DropdownMenuEntry<String>>[
    const DropdownMenuEntry(value: 'female', label: 'Female'),
    const DropdownMenuEntry(value: 'male', label: 'Male'),
    const DropdownMenuEntry(value: 'genderless', label: 'Genderless'),
    const DropdownMenuEntry(value: 'unknown', label: 'Unknown'),
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return AlertDialog(
      actions: [
        Align(
          alignment: Alignment.center,
          child: ElevatedButton(
            onPressed: () {
              var dto = FilterDto(
                gender: gender,
                status: status,
                species: species,
              );
              AutoRouter.of(context).pop(dto);
            },
            child: const Text('Filter'),
          ),
        )
      ],
      content: Container(
        width: 300,
        height: 210,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownMenu(
                width: 240,
                textStyle: theme.textTheme.bodyLarge,
                dropdownMenuEntries: statusEntries,
                hintText: 'Status',
                onSelected: (value) {
                  setState(() {
                    status = value ?? '';
                  });
                }),
            const SizedBox(
              height: 16,
            ),
            DropdownMenu(
                width: 240,
                textStyle: theme.textTheme.bodyLarge,
                hintText: 'Species',
                dropdownMenuEntries: speciesEntries,
                onSelected: (value) {
                  setState(() {
                    species = value ?? '';
                  });
                }),
            const SizedBox(
              height: 16,
            ),
            DropdownMenu(
                width: 240,
                textStyle: theme.textTheme.bodyLarge,
                hintText: 'gender',
                dropdownMenuEntries: genderEntries,
                onSelected: (value) {
                  setState(() {
                    gender = value ?? '';
                  });
                }),
          ],
        ),
      ),
    );
  }
}
