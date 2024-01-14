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

  String get tournamentPlanName => getField<String>('tournament_plan_name')!;
  set tournamentPlanName(String value) =>
      setField<String>('tournament_plan_name', value);

  int get clubId => getField<int>('club_id')!;
  set clubId(int value) => setField<int>('club_id', value);

  String? get photoUrl => getField<String>('photo_url');
  set photoUrl(String? value) => setField<String>('photo_url', value);

  int get planStage => getField<int>('plan_stage')!;
  set planStage(int value) => setField<int>('plan_stage', value);

  String get gender => getField<String>('gender')!;
  set gender(String value) => setField<String>('gender', value);
}
