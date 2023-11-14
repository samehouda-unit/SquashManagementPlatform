import '../database.dart';

class AcademyTable extends SupabaseTable<AcademyRow> {
  @override
  String get tableName => 'academy';

  @override
  AcademyRow createRow(Map<String, dynamic> data) => AcademyRow(data);
}

class AcademyRow extends SupabaseDataRow {
  AcademyRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AcademyTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String get address => getField<String>('address')!;
  set address(String value) => setField<String>('address', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get uuid => getField<String>('uuid')!;
  set uuid(String value) => setField<String>('uuid', value);

  int get createdBy => getField<int>('created_by')!;
  set createdBy(int value) => setField<int>('created_by', value);
}
