import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/navigation/app_router.gr.dart';
import 'package:rick_and_morty/screens/components/custom_button.dart';

@RoutePage()
class CharacterMainScreenWidget extends StatelessWidget {
  const CharacterMainScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text("Персонажи"),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(
              onTap: () => context.router.navigate(CharactersListRoute()),
              text: "Все персонажи",
              buttonHeight: 60,
            ),
            CustomButton(
              onTap: () => context.router.navigate(FindRoute()),
              text: "Найти персонажа",
              buttonHeight: 60,
            ),
          ],
        ),
      ),
    );
  }
}
