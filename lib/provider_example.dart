import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract base class Animal {
  final String name;

  Animal(this.name);
}

final class Cat extends Animal {
  Cat(super.name);
}

void main() {
  runApp(
    MaterialApp(
      home: MyPage(),
    ),
  );
}

// continuing from previous example...
class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {


  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider<Animal>.value(
        value: Cat('Pascal'),
        child: Builder(
          builder: (BuildContext innerContext) {
            final cat = Provider.of<Animal>(innerContext, listen: false);
            return Text(
              'Hello $cat',
            );
          },
        ),
      ),
    );
  }
}
