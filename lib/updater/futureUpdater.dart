import 'package:flutter/material.dart';

typedef LoadingBuilder = Widget Function(BuildContext);
typedef DataBuilder<T> = Widget Function(BuildContext, T?);
typedef ErrorBuilder<T> = Widget Function(BuildContext, dynamic, dynamic);

class FutureUpdater<T> extends StatefulWidget {
  const FutureUpdater({
    Key? key,
    this.loadingBuilder,
    required this.builder,
    this.errorBuilder,
    required this.future,
  }) : super(key: key);

  final LoadingBuilder? loadingBuilder;
  final DataBuilder<T> builder;
  final ErrorBuilder<T>? errorBuilder;
  final Future<T> future;

  // теперь мы вместо стрима передаем фьючу
  // Основной механизм
  // Передали фьючу
  // Пока ждем вызываем loadingBuilder
  // Завершилось вызвали DataBuilder
  // Упали с ошибкой, соответсвенно ErrorBuilder

  @override
  State<FutureUpdater> createState() => _FutureUpdaterState();
}

class _FutureUpdaterState<T> extends State<FutureUpdater> {
  T? _data;
  dynamic _error;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    setState(() {
      widget.future.then((value) {
        this._data = value;
        isLoading = false;
      }).onError((error, stackTrace) => _handleError(error));
    });
  }

  _handleError(error) {
    setState(() {
      _error = error;
    });
  }

  @override
  void didUpdateWidget(covariant FutureUpdater<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      widget.future.then((value) {
        this._data = value;
        isLoading = false;
      });
    });
    // если конфигурация обновляется, нам его тоже нужно обновить
  }

  @override
  void dispose() {
    // вроде очищать ничего не надо
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final errorBuilder = widget.errorBuilder;
    if (_error != null && errorBuilder != null) {
      return errorBuilder(context, _error, _data);
    }

    final loadingBuilder = widget.loadingBuilder;
    if (isLoading && loadingBuilder != null) {
      return loadingBuilder(context);
    }

    return widget.builder(context, _data);
  }
}
