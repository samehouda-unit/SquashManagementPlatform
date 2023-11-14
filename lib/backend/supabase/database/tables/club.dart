import '../database.dart';

class ClubTable extends SupabaseTable<ClubRow> {
  @override
  String get tableName => 'club';

  @override
  ClubRow createRow(Map<String, dynamic> data) => ClubRow(data);
}

class ClubRow extends SupabaseDataRow {
  ClubRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ClubTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get uuid => getField<String>('uuid')!;
  set uuid(String value) => setField<String>('uuid', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
