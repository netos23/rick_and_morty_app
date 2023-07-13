/* Еее,
* */
/*
import 'dart:async';
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




typedef LoadingBuilder = Widget Function(BuildContext);
typedef DataBuilder<T> = Widget Function(BuildContext, T?);
typedef ErrorBuilder<T> = Widget Function(BuildContext, dynamic, T?);

class StreamUpdater<T> extends StatefulWidget {
  const StreamUpdater({
    super.key,
    required this.stream,
    required this.builder,
    this.loadingBuilder,
    this.errorBuilder,
  });

  final LoadingBuilder? loadingBuilder;
  final DataBuilder<T> builder;
  final ErrorBuilder<T>? errorBuilder;
  final Stream<T> stream;

  @override
  State<StreamUpdater<T>> createState() => _StreamUpdaterState<T>();
}

class _StreamUpdaterState<T> extends State<StreamUpdater<T>> {
  T? _data;
  dynamic _error;
  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = widget.stream.listen(
      _handleEvent,
      onError: _handleError,
    );
  }

  _handleError(error) {
    setState(() {
      _error = error;
    });
  }

  void _handleEvent(event) {
    setState(() {
      _data = event;
    });
  }

  @override
  void didUpdateWidget(covariant StreamUpdater<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    _subscription?.cancel();
    _subscription = widget.stream.listen(
      _handleEvent,
      onError: _handleError,
    );
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final errorBuilder = widget.errorBuilder;
    if (_error != null && errorBuilder != null) {
      return errorBuilder(context, _error, _data);
    }

    final loadingBuilder = widget.loadingBuilder;
    if (_data == null && loadingBuilder != null) {
      return loadingBuilder(context);
    }

    return widget.builder(context, _data);
  }
}
*/
