// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skeleton_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class ExampleData extends DataClass implements Insertable<ExampleData> {
  final String id;
  final String name;
  ExampleData({required this.id, required this.name});
  factory ExampleData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ExampleData(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  ExampleCompanion toCompanion(bool nullToAbsent) {
    return ExampleCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory ExampleData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExampleData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  ExampleData copyWith({String? id, String? name}) => ExampleData(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('ExampleData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExampleData && other.id == this.id && other.name == this.name);
}

class ExampleCompanion extends UpdateCompanion<ExampleData> {
  final Value<String> id;
  final Value<String> name;
  const ExampleCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  ExampleCompanion.insert({
    required String id,
    required String name,
  })  : id = Value(id),
        name = Value(name);
  static Insertable<ExampleData> custom({
    Expression<String>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  ExampleCompanion copyWith({Value<String>? id, Value<String>? name}) {
    return ExampleCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExampleCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $ExampleTable extends Example with TableInfo<$ExampleTable, ExampleData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExampleTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? 'example';
  @override
  String get actualTableName => 'example';
  @override
  VerificationContext validateIntegrity(Insertable<ExampleData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExampleData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ExampleData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ExampleTable createAlias(String alias) {
    return $ExampleTable(attachedDatabase, alias);
  }
}

abstract class _$SkeletonDatabase extends GeneratedDatabase {
  _$SkeletonDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ExampleTable example = $ExampleTable(this);
  late final ExampleDao exampleDao = ExampleDao(this as SkeletonDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [example];
}
