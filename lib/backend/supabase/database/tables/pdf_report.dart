import '../database.dart';

class PdfReportTable extends SupabaseTable<PdfReportRow> {
  @override
  String get tableName => 'pdf_report';

  @override
  PdfReportRow createRow(Map<String, dynamic> data) => PdfReportRow(data);
}

class PdfReportRow extends SupabaseDataRow {
  PdfReportRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PdfReportTable();

  String? get playerName => getField<String>('player_name');
  set playerName(String? value) => setField<String>('player_name', value);

  String? get clubName => getField<String>('club_name');
  set clubName(String? value) => setField<String>('club_name', value);

  String? get playerRank => getField<String>('player_rank');
  set playerRank(String? value) => setField<String>('player_rank', value);

  String? get playerStage => getField<String>('player_stage');
  set playerStage(String? value) => setField<String>('player_stage', value);

  String? get tournamentPlanName => getField<String>('tournament_plan_name');
  set tournamentPlanName(String? value) =>
      setField<String>('tournament_plan_name', value);

  String? get tournamentName => getField<String>('tournament_name');
  set tournamentName(String? value) =>
      setField<String>('tournament_name', value);
}
