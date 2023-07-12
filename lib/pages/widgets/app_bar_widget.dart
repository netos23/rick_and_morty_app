import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget{
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 70,
      leading: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: Image.asset('assets/images/logo.png'),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.format_list_bulleted_outlined,
            ))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
