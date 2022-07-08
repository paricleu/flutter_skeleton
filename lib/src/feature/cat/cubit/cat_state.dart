import 'package:flutter_skeleton/src/feature/cat/cat_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cat_state.freezed.dart';

@freezed
class CatState with _$CatState {
  const factory CatState.loading() = Loading;

  const factory CatState.loaded(List<CatModel> cats) = Loaded;

  const factory CatState.error() = Error;
}
