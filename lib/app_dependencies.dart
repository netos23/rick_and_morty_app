import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/data/service/service.dart';
import 'package:rick_and_morty/util/network/dio_util.dart';

class AppDependencies extends StatelessWidget {
  const AppDependencies({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => DioUtil().dio),
        Provider(
          create: (context) => AppClient(
            context.read(),
          ),
        ),
      ],
      child: child,
    );
  }
}
