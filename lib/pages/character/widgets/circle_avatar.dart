import 'package:flutter/material.dart';

class CircleAvatarWidget extends StatelessWidget {
  const CircleAvatarWidget({Key? key, this.image}) : super(key: key);

  final image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xFFF2F2F7),
          width: 5,
        ),
      ),
      child: ClipOval(
        child: Image.network(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
