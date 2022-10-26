// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'entities.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 3261017807365784585),
      name: 'Member',
      lastPropertyId: const IdUid(6, 933392401817895968),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 7990927664945178656),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 3147022008888722829),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 3678443765602611091),
            name: 'relation',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 774119224328811979),
            name: 'age',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 1647567722381661209),
            name: 'avatar',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 933392401817895968),
            name: 'isAvatarImage',
            type: 1,
            flags: 0)
      ],
      relations: <ModelRelation>[
        ModelRelation(
            id: const IdUid(1, 6653372005734956530),
            name: 'logs',
            targetId: const IdUid(2, 5558302857323636184))
      ],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 5558302857323636184),
      name: 'MemberLog',
      lastPropertyId: const IdUid(6, 3678051895625802954),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 6822132804115479604),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 4570204105048120033),
            name: 'timestamp',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 2960908712970201720),
            name: 'oxygenSaturation',
            type: 8,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 3138617634698034990),
            name: 'pulse',
            type: 8,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 5278249302156037973),
            name: 'temp',
            type: 8,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 3678051895625802954),
            name: 'memberId',
            type: 11,
            flags: 520,
            indexId: const IdUid(1, 8385766347508653733),
            relationTarget: 'Member')
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(3, 4257045197649956851),
      name: 'Settings',
      lastPropertyId: const IdUid(2, 4060314223261997726),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 1779377877053546178),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 4060314223261997726),
            name: 'customRelations',
            type: 30,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(3, 4257045197649956851),
      lastIndexId: const IdUid(1, 8385766347508653733),
      lastRelationId: const IdUid(1, 6653372005734956530),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Member: EntityDefinition<Member>(
        model: _entities[0],
        toOneRelations: (Member object) => [],
        toManyRelations: (Member object) =>
            {RelInfo<Member>.toMany(1, object.id): object.logs},
        getId: (Member object) => object.id,
        setId: (Member object, int id) {
          object.id = id;
        },
        objectToFB: (Member object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          final relationOffset = fbb.writeString(object.relation);
          final avatarOffset = fbb.writeString(object.avatar);
          fbb.startTable(7);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addOffset(2, relationOffset);
          fbb.addInt64(3, object.age);
          fbb.addOffset(4, avatarOffset);
          fbb.addBool(5, object.isAvatarImage);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Member(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              name: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              relation: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, ''),
              age: const fb.Int64Reader()
                  .vTableGetNullable(buffer, rootOffset, 10),
              avatar: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 12, ''),
              isAvatarImage: const fb.BoolReader()
                  .vTableGet(buffer, rootOffset, 14, false));
          InternalToManyAccess.setRelInfo(object.logs, store,
              RelInfo<Member>.toMany(1, object.id), store.box<Member>());
          return object;
        }),
    MemberLog: EntityDefinition<MemberLog>(
        model: _entities[1],
        toOneRelations: (MemberLog object) => [object.member],
        toManyRelations: (MemberLog object) => {},
        getId: (MemberLog object) => object.id,
        setId: (MemberLog object, int id) {
          object.id = id;
        },
        objectToFB: (MemberLog object, fb.Builder fbb) {
          fbb.startTable(7);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.timestamp.millisecondsSinceEpoch);
          fbb.addFloat64(2, object.oxygenSaturation);
          fbb.addFloat64(3, object.pulse);
          fbb.addFloat64(4, object.temp);
          fbb.addInt64(5, object.member.targetId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = MemberLog(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              oxygenSaturation: const fb.Float64Reader()
                  .vTableGetNullable(buffer, rootOffset, 8),
              pulse: const fb.Float64Reader()
                  .vTableGetNullable(buffer, rootOffset, 10),
              temp: const fb.Float64Reader()
                  .vTableGetNullable(buffer, rootOffset, 12))
            ..timestamp = DateTime.fromMillisecondsSinceEpoch(
                const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0));
          object.member.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 14, 0);
          object.member.attach(store);
          return object;
        }),
    Settings: EntityDefinition<Settings>(
        model: _entities[2],
        toOneRelations: (Settings object) => [],
        toManyRelations: (Settings object) => {},
        getId: (Settings object) => object.id,
        setId: (Settings object, int id) {
          object.id = id;
        },
        objectToFB: (Settings object, fb.Builder fbb) {
          final customRelationsOffset = object.customRelations == null
              ? null
              : fbb.writeList(object.customRelations!
                  .map(fbb.writeString)
                  .toList(growable: false));
          fbb.startTable(3);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, customRelationsOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Settings(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              customRelations: const fb.ListReader<String>(
                      fb.StringReader(asciiOptimization: true),
                      lazy: false)
                  .vTableGetNullable(buffer, rootOffset, 6));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Member] entity fields to define ObjectBox queries.
class Member_ {
  /// see [Member.id]
  static final id = QueryIntegerProperty<Member>(_entities[0].properties[0]);

  /// see [Member.name]
  static final name = QueryStringProperty<Member>(_entities[0].properties[1]);

  /// see [Member.relation]
  static final relation =
      QueryStringProperty<Member>(_entities[0].properties[2]);

  /// see [Member.age]
  static final age = QueryIntegerProperty<Member>(_entities[0].properties[3]);

  /// see [Member.avatar]
  static final avatar = QueryStringProperty<Member>(_entities[0].properties[4]);

  /// see [Member.isAvatarImage]
  static final isAvatarImage =
      QueryBooleanProperty<Member>(_entities[0].properties[5]);

  /// see [Member.logs]
  static final logs =
      QueryRelationToMany<Member, MemberLog>(_entities[0].relations[0]);
}

/// [MemberLog] entity fields to define ObjectBox queries.
class MemberLog_ {
  /// see [MemberLog.id]
  static final id = QueryIntegerProperty<MemberLog>(_entities[1].properties[0]);

  /// see [MemberLog.timestamp]
  static final timestamp =
      QueryIntegerProperty<MemberLog>(_entities[1].properties[1]);

  /// see [MemberLog.oxygenSaturation]
  static final oxygenSaturation =
      QueryDoubleProperty<MemberLog>(_entities[1].properties[2]);

  /// see [MemberLog.pulse]
  static final pulse =
      QueryDoubleProperty<MemberLog>(_entities[1].properties[3]);

  /// see [MemberLog.temp]
  static final temp =
      QueryDoubleProperty<MemberLog>(_entities[1].properties[4]);

  /// see [MemberLog.member]
  static final member =
      QueryRelationToOne<MemberLog, Member>(_entities[1].properties[5]);
}

/// [Settings] entity fields to define ObjectBox queries.
class Settings_ {
  /// see [Settings.id]
  static final id = QueryIntegerProperty<Settings>(_entities[2].properties[0]);

  /// see [Settings.customRelations]
  static final customRelations =
      QueryStringVectorProperty<Settings>(_entities[2].properties[1]);
}