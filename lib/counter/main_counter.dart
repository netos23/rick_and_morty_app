import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/counter/future_updater.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  Future<int> _fetchCounter() async {
    await Future.delayed(const Duration(seconds: 1));
    return _counter;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              FutureUpdater<int>(
                future: _fetchCounter(),
                loadingBuilder: (_) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorBuilder: (context, error, data) => Text('Error: $error'),
                builder: (context, counter) {
                  return Text(
                    'Counter: $counter',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                },
              ),
            ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _counter++;
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
