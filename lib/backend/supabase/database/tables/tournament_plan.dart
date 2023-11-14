import '../database.dart';

class TournamentPlanTable extends SupabaseTable<TournamentPlanRow> {
  @override
  String get tableName => 'tournament_plan';

  @override
  TournamentPlanRow createRow(Map<String, dynamic> data) =>
      TournamentPlanRow(data);
}

class TournamentPlanRow extends SupabaseDataRow {
  TournamentPlanRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TournamentPlanTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get uuid => getField<String>('uuid')!;
  set uuid(String value) => setField<String>('uuid', value);

  int get tournamentId => getField<int>('tournament_id')!;
  set tournamentId(int value) => setField<int>('tournament_id', value);

  DateTime get dateFrom => getField<DateTime>('date_from')!;
  set dateFrom(DateTime value) => setField<DateTime>('date_from', value);

  DateTime get dateTo => getField<DateTime>('date_to')!;
  set dateTo(DateTime value) => setField<DateTime>('date_to', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
