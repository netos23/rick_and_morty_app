import 'package:flutter/material.dart';

typedef LoadingBuilder = Widget Function(BuildContext);
typedef DataBuilder<T> = Widget Function(BuildContext, T?);
typedef ErrorBuilder<T> = Widget Function(BuildContext, dynamic, T?);

class FutureUpdater<T> extends StatefulWidget {
  const FutureUpdater({
    super.key,
    required this.builder,
    this.loadingBuilder,
    this.errorBuilder,
    required this.future,
    required this.initValue,
  });

  final LoadingBuilder? loadingBuilder;
  final DataBuilder<T> builder;
  final ErrorBuilder<T>? errorBuilder;
  final Future<T> future;
  final T initValue;

  @override
  State<FutureUpdater<T>> createState() => _FutureUpdaterState<T>();
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
