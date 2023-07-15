import 'package:flutter/cupertino.dart';

extension FunctionExtensions<T extends Object?, R> on T {
  R? let(R Function(T) function) {
    final value = this;
    if (value == null) {
      return null;
    }

    return function(value);
  }
}
