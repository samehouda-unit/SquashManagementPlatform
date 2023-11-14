import '../database.dart';

class TournamentPlayerTable extends SupabaseTable<TournamentPlayerRow> {
  @override
  String get tableName => 'tournament_player';

  @override
  TournamentPlayerRow createRow(Map<String, dynamic> data) =>
      TournamentPlayerRow(data);
}

class TournamentPlayerRow extends SupabaseDataRow {
  TournamentPlayerRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TournamentPlayerTable();

  int get tournamentPlanId => getField<int>('tournament_plan_id')!;
  set tournamentPlanId(int value) => setField<int>('tournament_plan_id', value);

  int get playerId => getField<int>('player_id')!;
  set playerId(int value) => setField<int>('player_id', value);

  int get clubId => getField<int>('club_id')!;
  set clubId(int value) => setField<int>('club_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
