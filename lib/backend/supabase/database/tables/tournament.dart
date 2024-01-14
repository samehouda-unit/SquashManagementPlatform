import '../database.dart';

class TournamentTable extends SupabaseTable<TournamentRow> {
  @override
  String get tableName => 'tournament';

  @override
  TournamentRow createRow(Map<String, dynamic> data) => TournamentRow(data);
}

class TournamentRow extends SupabaseDataRow {
  TournamentRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TournamentTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get uuid => getField<String>('uuid')!;
  set uuid(String value) => setField<String>('uuid', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get year => getField<String>('year');
  set year(String? value) => setField<String>('year', value);

  String? get sponsors => getField<String>('sponsors');
  set sponsors(String? value) => setField<String>('sponsors', value);
}
