import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/src/data/local/local_repository.dart';
import 'package:flutter_skeleton/src/data/remote/remote_repository.dart';
import 'package:flutter_skeleton/src/data/repositories/cat_repository.dart';
import 'package:flutter_skeleton/src/feature/home/home_screen.dart';
import 'package:flutter_skeleton/src/util/skeleton_theme.dart';

final globalNavKey = GlobalKey<NavigatorState>();

class SkeletonApp extends StatelessWidget {
  final LocalRepository localRepo;
  final RemoteRepository remoteRepo;

  const SkeletonApp({
    Key? key,
    required this.localRepo,
    required this.remoteRepo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => CatRepository(localRepo, remoteRepo),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        navigatorKey: globalNavKey,
        theme: lightTheme,
        home: const HomeScreen(initialPage: 0),
      ),
    );
  }
}
