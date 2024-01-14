import '../database.dart';

class MatchTable extends SupabaseTable<MatchRow> {
  @override
  String get tableName => 'match';

  @override
  MatchRow createRow(Map<String, dynamic> data) => MatchRow(data);
}

class MatchRow extends SupabaseDataRow {
  MatchRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MatchTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get uuid => getField<String>('uuid')!;
  set uuid(String value) => setField<String>('uuid', value);

  int get tournamentPlanId => getField<int>('tournament_plan_id')!;
  set tournamentPlanId(int value) => setField<int>('tournament_plan_id', value);

  int get eventId => getField<int>('event_id')!;
  set eventId(int value) => setField<int>('event_id', value);

  DateTime get matchTime => getField<DateTime>('match_time')!;
  set matchTime(DateTime value) => setField<DateTime>('match_time', value);

  int get player1Id => getField<int>('player1_id')!;
  set player1Id(int value) => setField<int>('player1_id', value);

  int get player2Id => getField<int>('player2_id')!;
  set player2Id(int value) => setField<int>('player2_id', value);
}
