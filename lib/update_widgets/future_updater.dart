import 'package:flutter/material.dart';

typedef LoadingBuilder = Widget Function(BuildContext);
typedef DataBuilder<T> = Widget Function(BuildContext, T?);
typedef ErrorBuilder<T> = Widget Function(BuildContext, dynamic, T?);

class FutureUpdater<T> extends StatefulWidget {
  const FutureUpdater({
    super.key,
    this.loadingBuilder,
    this.errorBuilder,
    required this.future,
    required this.initialValue,
    required this.builder,

  });

  final LoadingBuilder? loadingBuilder;
  final ErrorBuilder<T>? errorBuilder;

  final Future<T> future;
  final T initialValue;
  final DataBuilder<T> builder;


  @override
  State<FutureUpdater> createState() => _FutureUpdaterState();
}

class _FutureUpdaterState<T> extends State<FutureUpdater<T>> {
  T? _data;
  dynamic _error;

  @override
  Future<void> initState() async {
    super.initState();
    _data = await widget.future.catchError(_handleError);
  }

  _handleError(error) {
    setState(() {
      _error = error;
    });
  }

  @override
  void dispose() {
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
