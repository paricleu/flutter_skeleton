import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/src/data/repositories/cat_repository.dart';
import 'package:flutter_skeleton/src/feature/cat/cubit/cat_state.dart';

class CatCubit extends Cubit<CatState> {
  final CatRepository repo;

  CatCubit(this.repo) : super(const CatState.loading());

  Future<void> loadCats() async {
    final result = await repo.getCatList(20, 1);
    result.when(
      success: (data) {
        emit(CatState.loaded(data));
      },
      failure: (error) {
        debugPrint('Emit error state and show user facing error');
      },
    );
  }
}
