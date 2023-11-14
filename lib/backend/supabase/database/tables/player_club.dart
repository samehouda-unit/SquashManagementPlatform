import '../database.dart';

class PlayerClubTable extends SupabaseTable<PlayerClubRow> {
  @override
  String get tableName => 'player_club';

  @override
  PlayerClubRow createRow(Map<String, dynamic> data) => PlayerClubRow(data);
}

class PlayerClubRow extends SupabaseDataRow {
  PlayerClubRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PlayerClubTable();

  int get playerId => getField<int>('player_id')!;
  set playerId(int value) => setField<int>('player_id', value);

  int get clubId => getField<int>('club_id')!;
  set clubId(int value) => setField<int>('club_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
