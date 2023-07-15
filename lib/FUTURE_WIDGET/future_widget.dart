/*
 Постарался реализовать FutureUpdater
 через StreamUpdater, который на лекции
 представили
 P.S. Я учусь, не бейте тапком please
 */


import 'dart:async';
import 'package:flutter/material.dart';

typedef LoadingBuilder = Widget Function(BuildContext);
typedef DataBuilder<T> = Widget Function(BuildContext, T?);
typedef ErrorBuilder<T> = Widget Function(BuildContext, dynamic, T?);

class FutureUpdater<T> extends StatefulWidget {
  const FutureUpdater({
    super.key,
    required this.future,
    required this.builder,
    this.loadingBuilder,
    this.errorBuilder,
  });

  final LoadingBuilder? loadingBuilder;
  final DataBuilder<T> builder;
  final ErrorBuilder<T>? errorBuilder;
  final Future<T> future;

  @override
  State<FutureUpdater<T>> createState() => _FutureUpdaterState<T>();
}

class _FutureUpdaterState<T> extends State<FutureUpdater<T>> {
  T? _data;
  dynamic _error;

  @override
  void initState() {
    super.initState();
  }

  _handleError(error) {
    setState(() {
      _error = error;
    });
  }

  void _handleVal(val) {
    setState(() {
      _data = val;
    });
  }

  void changeFuture() {
    widget.future.then(_handleVal).catchError(_handleError);
  }

  @override
  void didUpdateWidget(covariant FutureUpdater<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.future != widget.future) {
      changeFuture();
    }
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
