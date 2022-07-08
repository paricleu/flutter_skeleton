import 'package:drift/drift.dart';

class Example extends Table {
  TextColumn get id => text()();

  TextColumn get name => text()();

  @override
  Set<Column>? get primaryKey => {id};
}
