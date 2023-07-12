/* Я дурик и не понял, что должен наш FUTURE виджет по условию делать,
*  Возможно, мне нужно было сделать свою реализацию класса
*  AsyncSnapshot, но опять же, непонятно как, ведь можно просто через зажатый ctrl
*  Посмотреть его внутренности, ЕЩЁ РАЗ СОРРИ, БЬЮ ЧЕЛОМ, сделал простенький виджет,
*  который принимает данные, а до их принятия крутит значок загрузки. Ы
* */

import 'package:flutter/material.dart';

class FutureWidget<T> extends StatelessWidget {
  final Future<T> futureData;

  FutureWidget({required this.futureData});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: futureData,
      builder: (BuildContext context, AsyncSnapshot<T> aShot) { //Азхазхвазвхазх, переменная Ашот, что за мем
        if (aShot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (aShot.hasError) {
          return Text('${aShot.error}');
        } else if (aShot.hasData) {
          return Text('${aShot.data}');
        } else {
          return const Text('NO DATA');
        }
      },
    );
  }
}