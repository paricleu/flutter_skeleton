import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/src/app.dart';
import 'package:flutter_skeleton/src/data/local/database/skeleton_database.dart';
import 'package:flutter_skeleton/src/data/local/local_repository.dart';
import 'package:flutter_skeleton/src/data/remote/remote_repository.dart';
import 'package:flutter_skeleton/src/util/skeleton_bloc_observer.dart';

void main() {
  const String apiKey = "3745a7eb-b0d4-4688-9015-91cea9476518";

  final localRepo = LocalRepository(SkeletonDatabase());
  final remoteRepo = RemoteRepository(apiKey: apiKey, isDev: false);

  BlocOverrides.runZoned(
    () => runApp(SkeletonApp(localRepo: localRepo, remoteRepo: remoteRepo)),
    blocObserver: SkeletonBlocObserver(),
  );
}
