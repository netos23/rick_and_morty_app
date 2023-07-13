import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/pages/character_list_page.dart';

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          primary: Colors.green,
          seedColor: Colors.green,
        ),
      ),
      home: CharacterListPage(
        client: context.read(),
      ),
    );
  }
}

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final String imageUrlA =
      'https://avatars.mds.yandex.net/i?id=a14641668e97ca5adc7e9511e84c459cdb10dd51-9197564-images-thumbs&n=13';
  final String? imageUrl = null;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Theme(
      data: themeData.copyWith(
        colorScheme: themeData.colorScheme.copyWith(
          primary: Colors.red,
        ),
      ),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.primary,
          onPressed: a,
          child: const Icon(Icons.dangerous_outlined),
        ),
        body: Image.network(
          imageUrl ?? '',
          errorBuilder: (_, __, ___) => Image.network(imageUrlA),
        ),
      ),
    );
  }

  void a() {
    b();
  }

  void b() {
    c();
  }

  void c() {
    try {
      d();
    } catch (e, stackTrace) {
      print(e);
      Error.throwWithStackTrace(Exception('c'), stackTrace);
    }
  }

  void d() {
    e();
  }

  void e() {
    throw Exception('e');
  }
}
