import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_skeleton/src/data/local/database/dao/example_dao.dart';
import 'package:flutter_skeleton/src/data/local/database/tables/example_table.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'skeleton_database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'skeleton.db'));
    return NativeDatabase(file, logStatements: kDebugMode);
  });
}

@DriftDatabase(
  tables: [
    Example,
  ],
  daos: [
    ExampleDao,
  ],
)
class SkeletonDatabase extends _$SkeletonDatabase {
  // more info about moor: https://drift.simonbinder.eu/docs/
  SkeletonDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) {
        return m.createAll();
      },
      onUpgrade: (m, from, to) async {
        // https://moor.simonbinder.eu/docs/advanced-features/migrations/
      },
      beforeOpen: (details) async {},
    );
  }

  Future<void> deleteEverything() {
    return transaction(() async {
      for (final table in allTables) {
        await delete(table).go();
      }
    });
  }
}
