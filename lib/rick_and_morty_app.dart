import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/model/future_updater.dart';
import 'package:rick_and_morty/model/location/location.dart';
import 'package:rick_and_morty/service/service.dart';

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final dio = Dio()..options.baseUrl = 'https://rickandmortyapi.com/api';
    final client = RestClient(dio);

    return Scaffold(
      appBar: AppBar(
        title: Text('Location'),
      ),
      body:
      FutureUpdater(
        future: client.getLocation(),
        builder: (context, data) {
          data??=[];
          return ListView.builder(itemCount: data.length, itemBuilder: (context, index){
            return Text(data![index].toString());
          });
        },
        loadingBuilder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        },
        errorBuilder: (context, error, data){
          print(error.toString());
          return Text(error.toString());
        },
      ),
    );
  }
}
