import '../database.dart';

class PlayerTable extends SupabaseTable<PlayerRow> {
  @override
  String get tableName => 'player';

  @override
  PlayerRow createRow(Map<String, dynamic> data) => PlayerRow(data);
}

class PlayerRow extends SupabaseDataRow {
  PlayerRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PlayerTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  DateTime? get dateOfBirth => getField<DateTime>('date_of_birth');
  set dateOfBirth(DateTime? value) =>
      setField<DateTime>('date_of_birth', value);

  int? get rank => getField<int>('rank');
  set rank(int? value) => setField<int>('rank', value);

  int? get stage => getField<int>('stage');
  set stage(int? value) => setField<int>('stage', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
