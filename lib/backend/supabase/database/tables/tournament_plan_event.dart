import '../database.dart';

class TournamentPlanEventTable extends SupabaseTable<TournamentPlanEventRow> {
  @override
  String get tableName => 'tournament_plan_event';

  @override
  TournamentPlanEventRow createRow(Map<String, dynamic> data) =>
      TournamentPlanEventRow(data);
}

class TournamentPlanEventRow extends SupabaseDataRow {
  TournamentPlanEventRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TournamentPlanEventTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get uuid => getField<String>('uuid')!;
  set uuid(String value) => setField<String>('uuid', value);

  int get tournamentPlanId => getField<int>('tournament_plan_id')!;
  set tournamentPlanId(int value) => setField<int>('tournament_plan_id', value);

  DateTime get dateFrom => getField<DateTime>('date_from')!;
  set dateFrom(DateTime value) => setField<DateTime>('date_from', value);

  DateTime get dateTo => getField<DateTime>('date_to')!;
  set dateTo(DateTime value) => setField<DateTime>('date_to', value);

  int get clubId => getField<int>('club_id')!;
  set clubId(int value) => setField<int>('club_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
