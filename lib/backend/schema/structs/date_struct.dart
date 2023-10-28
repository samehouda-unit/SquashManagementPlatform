// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DateStruct extends BaseStruct {
  DateStruct({
    DateTime? dateType,
  }) : _dateType = dateType;

  // "DateType" field.
  DateTime? _dateType;
  DateTime? get dateType => _dateType;
  set dateType(DateTime? val) => _dateType = val;
  bool hasDateType() => _dateType != null;

  static DateStruct fromMap(Map<String, dynamic> data) => DateStruct(
        dateType: data['DateType'] as DateTime?,
      );

  static DateStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? DateStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'DateType': _dateType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'DateType': serializeParam(
          _dateType,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static DateStruct fromSerializableMap(Map<String, dynamic> data) =>
      DateStruct(
        dateType: deserializeParam(
          data['DateType'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'DateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DateStruct && dateType == other.dateType;
  }

  @override
  int get hashCode => const ListEquality().hash([dateType]);
}

DateStruct createDateStruct({
  DateTime? dateType,
}) =>
    DateStruct(
      dateType: dateType,
    );
