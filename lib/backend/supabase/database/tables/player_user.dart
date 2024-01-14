import '../database.dart';

class PlayerUserTable extends SupabaseTable<PlayerUserRow> {
  @override
  String get tableName => 'player_user';

  @override
  PlayerUserRow createRow(Map<String, dynamic> data) => PlayerUserRow(data);
}

class PlayerUserRow extends SupabaseDataRow {
  PlayerUserRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PlayerUserTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get uuid => getField<String>('uuid');
  set uuid(String? value) => setField<String>('uuid', value);

  int? get playerId => getField<int>('player_id');
  set playerId(int? value) => setField<int>('player_id', value);
}
