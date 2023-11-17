// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlayerStruct extends BaseStruct {
  PlayerStruct({
    int? playerId,
    String? name,
    DateTime? dateOfBirth,
    int? rank,
    int? stage,
  })  : _playerId = playerId,
        _name = name,
        _dateOfBirth = dateOfBirth,
        _rank = rank,
        _stage = stage;

  // "player_id" field.
  int? _playerId;
  int get playerId => _playerId ?? 0;
  set playerId(int? val) => _playerId = val;
  void incrementPlayerId(int amount) => _playerId = playerId + amount;
  bool hasPlayerId() => _playerId != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "date_of_birth" field.
  DateTime? _dateOfBirth;
  DateTime? get dateOfBirth => _dateOfBirth;
  set dateOfBirth(DateTime? val) => _dateOfBirth = val;
  bool hasDateOfBirth() => _dateOfBirth != null;

  // "rank" field.
  int? _rank;
  int get rank => _rank ?? 0;
  set rank(int? val) => _rank = val;
  void incrementRank(int amount) => _rank = rank + amount;
  bool hasRank() => _rank != null;

  // "stage" field.
  int? _stage;
  int get stage => _stage ?? 0;
  set stage(int? val) => _stage = val;
  void incrementStage(int amount) => _stage = stage + amount;
  bool hasStage() => _stage != null;

  static PlayerStruct fromMap(Map<String, dynamic> data) => PlayerStruct(
        playerId: castToType<int>(data['player_id']),
        name: data['name'] as String?,
        dateOfBirth: data['date_of_birth'] as DateTime?,
        rank: castToType<int>(data['rank']),
        stage: castToType<int>(data['stage']),
      );

  static PlayerStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? PlayerStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'player_id': _playerId,
        'name': _name,
        'date_of_birth': _dateOfBirth,
        'rank': _rank,
        'stage': _stage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'player_id': serializeParam(
          _playerId,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'date_of_birth': serializeParam(
          _dateOfBirth,
          ParamType.DateTime,
        ),
        'rank': serializeParam(
          _rank,
          ParamType.int,
        ),
        'stage': serializeParam(
          _stage,
          ParamType.int,
        ),
      }.withoutNulls;

  static PlayerStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlayerStruct(
        playerId: deserializeParam(
          data['player_id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        dateOfBirth: deserializeParam(
          data['date_of_birth'],
          ParamType.DateTime,
          false,
        ),
        rank: deserializeParam(
          data['rank'],
          ParamType.int,
          false,
        ),
        stage: deserializeParam(
          data['stage'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PlayerStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PlayerStruct &&
        playerId == other.playerId &&
        name == other.name &&
        dateOfBirth == other.dateOfBirth &&
        rank == other.rank &&
        stage == other.stage;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([playerId, name, dateOfBirth, rank, stage]);
}

PlayerStruct createPlayerStruct({
  int? playerId,
  String? name,
  DateTime? dateOfBirth,
  int? rank,
  int? stage,
}) =>
    PlayerStruct(
      playerId: playerId,
      name: name,
      dateOfBirth: dateOfBirth,
      rank: rank,
      stage: stage,
    );
