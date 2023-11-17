import '../database.dart';

class PlayerRankLkpTable extends SupabaseTable<PlayerRankLkpRow> {
  @override
  String get tableName => 'player_rank_lkp';

  @override
  PlayerRankLkpRow createRow(Map<String, dynamic> data) =>
      PlayerRankLkpRow(data);
}

class PlayerRankLkpRow extends SupabaseDataRow {
  PlayerRankLkpRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PlayerRankLkpTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);
}
