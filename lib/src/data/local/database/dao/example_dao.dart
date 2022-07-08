import 'package:drift/drift.dart';
import 'package:flutter_skeleton/src/data/local/database/skeleton_database.dart';
import 'package:flutter_skeleton/src/data/local/database/tables/example_table.dart';

part 'example_dao.g.dart';

@DriftAccessor(tables: [Example])
class ExampleDao extends DatabaseAccessor<SkeletonDatabase>
    with _$ExampleDaoMixin {
  final SkeletonDatabase db;

  ExampleDao(this.db) : super(db);
}
