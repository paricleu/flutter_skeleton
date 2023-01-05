import 'package:flutter_skeleton/src/data/local/local_repository.dart';
import 'package:flutter_skeleton/src/data/remote/api_result.dart';
import 'package:flutter_skeleton/src/data/remote/remote_repository.dart';
import 'package:flutter_skeleton/src/feature/cat/cat_model.dart';

// ignore_for_file: unused_field
class CatRepository {
  final RemoteRepository _remoteRepo;
  final LocalRepository _localRepo;

  CatRepository(this._localRepo, this._remoteRepo);

  Future<ApiResult<List<CatModel>>> getCatList([int? limit, int? page]) async {
    final response = await _remoteRepo.getCatList(limit, page);
    return response.when(
      success: (data) {
        return ApiResult.success(
          data.map((e) => CatModel(e.id, e.imageUrl)).toList(),
        );
      },
      failure: (error) {
        return ApiResult.failure(error: error);
      },
    );
  }
}
