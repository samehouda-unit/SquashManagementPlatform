import '../database.dart';

class TournamentPlanLocationTable
    extends SupabaseTable<TournamentPlanLocationRow> {
  @override
  String get tableName => 'tournament_plan_location';

  @override
  TournamentPlanLocationRow createRow(Map<String, dynamic> data) =>
      TournamentPlanLocationRow(data);
}

class TournamentPlanLocationRow extends SupabaseDataRow {
  TournamentPlanLocationRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TournamentPlanLocationTable();

  int get tournamentPlanId => getField<int>('tournament_plan_id')!;
  set tournamentPlanId(int value) => setField<int>('tournament_plan_id', value);

  int get clubId => getField<int>('club_id')!;
  set clubId(int value) => setField<int>('club_id', value);
}
