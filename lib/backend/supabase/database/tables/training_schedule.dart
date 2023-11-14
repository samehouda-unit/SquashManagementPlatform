import '../database.dart';

class TrainingScheduleTable extends SupabaseTable<TrainingScheduleRow> {
  @override
  String get tableName => 'training_schedule';

  @override
  TrainingScheduleRow createRow(Map<String, dynamic> data) =>
      TrainingScheduleRow(data);
}

class TrainingScheduleRow extends SupabaseDataRow {
  TrainingScheduleRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TrainingScheduleTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get uuid => getField<String>('uuid')!;
  set uuid(String value) => setField<String>('uuid', value);

  String get scheduleName => getField<String>('schedule_name')!;
  set scheduleName(String value) => setField<String>('schedule_name', value);

  DateTime get fromDate => getField<DateTime>('from_date')!;
  set fromDate(DateTime value) => setField<DateTime>('from_date', value);

  DateTime get toDate => getField<DateTime>('to_date')!;
  set toDate(DateTime value) => setField<DateTime>('to_date', value);

  int get trainingId => getField<int>('training_id')!;
  set trainingId(int value) => setField<int>('training_id', value);

  DateTime get createdOn => getField<DateTime>('created_on')!;
  set createdOn(DateTime value) => setField<DateTime>('created_on', value);

  int get createdBy => getField<int>('created_by')!;
  set createdBy(int value) => setField<int>('created_by', value);

  DateTime? get deletedOn => getField<DateTime>('deleted_on');
  set deletedOn(DateTime? value) => setField<DateTime>('deleted_on', value);
}
