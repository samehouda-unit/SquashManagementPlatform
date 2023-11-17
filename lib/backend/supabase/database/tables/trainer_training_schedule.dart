import '../database.dart';

class TrainerTrainingScheduleTable
    extends SupabaseTable<TrainerTrainingScheduleRow> {
  @override
  String get tableName => 'trainer_training_schedule';

  @override
  TrainerTrainingScheduleRow createRow(Map<String, dynamic> data) =>
      TrainerTrainingScheduleRow(data);
}

class TrainerTrainingScheduleRow extends SupabaseDataRow {
  TrainerTrainingScheduleRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TrainerTrainingScheduleTable();

  int get trainerId => getField<int>('trainer_id')!;
  set trainerId(int value) => setField<int>('trainer_id', value);

  int get trainingScheduleId => getField<int>('training_schedule_id')!;
  set trainingScheduleId(int value) =>
      setField<int>('training_schedule_id', value);
}
