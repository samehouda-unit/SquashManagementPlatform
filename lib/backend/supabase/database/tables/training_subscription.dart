import '../database.dart';

class TrainingSubscriptionTable extends SupabaseTable<TrainingSubscriptionRow> {
  @override
  String get tableName => 'training_subscription';

  @override
  TrainingSubscriptionRow createRow(Map<String, dynamic> data) =>
      TrainingSubscriptionRow(data);
}

class TrainingSubscriptionRow extends SupabaseDataRow {
  TrainingSubscriptionRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TrainingSubscriptionTable();

  int get memberId => getField<int>('member_id')!;
  set memberId(int value) => setField<int>('member_id', value);

  int get trainingScheduleId => getField<int>('training_schedule_id')!;
  set trainingScheduleId(int value) =>
      setField<int>('training_schedule_id', value);
}
