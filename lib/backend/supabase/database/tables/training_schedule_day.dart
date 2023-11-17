import '../database.dart';

class TrainingScheduleDayTable extends SupabaseTable<TrainingScheduleDayRow> {
  @override
  String get tableName => 'training_schedule_day';

  @override
  TrainingScheduleDayRow createRow(Map<String, dynamic> data) =>
      TrainingScheduleDayRow(data);
}

class TrainingScheduleDayRow extends SupabaseDataRow {
  TrainingScheduleDayRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TrainingScheduleDayTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get uuid => getField<String>('uuid')!;
  set uuid(String value) => setField<String>('uuid', value);

  String get trainingWeekday => getField<String>('training_weekday')!;
  set trainingWeekday(String value) =>
      setField<String>('training_weekday', value);

  PostgresTime get timeFrom => getField<PostgresTime>('time_from')!;
  set timeFrom(PostgresTime value) =>
      setField<PostgresTime>('time_from', value);

  PostgresTime get timeTo => getField<PostgresTime>('time_to')!;
  set timeTo(PostgresTime value) => setField<PostgresTime>('time_to', value);

  int get trainingScheduleId => getField<int>('training_schedule_id')!;
  set trainingScheduleId(int value) =>
      setField<int>('training_schedule_id', value);

  DateTime get createdOn => getField<DateTime>('created_on')!;
  set createdOn(DateTime value) => setField<DateTime>('created_on', value);

  int get createdBy => getField<int>('created_by')!;
  set createdBy(int value) => setField<int>('created_by', value);

  DateTime? get deletedOn => getField<DateTime>('deleted_on');
  set deletedOn(DateTime? value) => setField<DateTime>('deleted_on', value);
}
