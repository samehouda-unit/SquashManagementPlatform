import '../database.dart';

class PlayerStageLkpTable extends SupabaseTable<PlayerStageLkpRow> {
  @override
  String get tableName => 'player_stage_lkp';

  @override
  PlayerStageLkpRow createRow(Map<String, dynamic> data) =>
      PlayerStageLkpRow(data);
}

class PlayerStageLkpRow extends SupabaseDataRow {
  PlayerStageLkpRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PlayerStageLkpTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);
}
