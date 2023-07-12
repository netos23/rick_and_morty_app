import 'package:flutter/material.dart';
import 'package:rick_and_morty/model/future_updater.dart';

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location'),
      ),
      body:
      FutureUpdater(
        future: Future(() async {
          await Future.delayed(Duration(seconds: 3));
          return 'Complite';
        }),
        builder: (context, data) {
          data ??= '-1';
          return Text(data);
        },
        loadingBuilder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        },
        errorBuilder: (context, error, data){
          return Text(error.toString());
        },
      ),
    );
  }
}
