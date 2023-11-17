import '../database.dart';

class TrainingTable extends SupabaseTable<TrainingRow> {
  @override
  String get tableName => 'training';

  @override
  TrainingRow createRow(Map<String, dynamic> data) => TrainingRow(data);
}

class TrainingRow extends SupabaseDataRow {
  TrainingRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TrainingTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get uuid => getField<String>('uuid')!;
  set uuid(String value) => setField<String>('uuid', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  DateTime get createdOn => getField<DateTime>('created_on')!;
  set createdOn(DateTime value) => setField<DateTime>('created_on', value);

  int get createdBy => getField<int>('created_by')!;
  set createdBy(int value) => setField<int>('created_by', value);

  DateTime? get deletedOn => getField<DateTime>('deleted_on');
  set deletedOn(DateTime? value) => setField<DateTime>('deleted_on', value);
}
