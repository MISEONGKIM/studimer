import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:studimer/src/data/datasources/local/DAOs/study_record_dao.dart';
import 'package:studimer/src/domain/entities/study_record.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [StudyRecord]) //엔터티 등록
abstract class AppDatabase extends FloorDatabase {
  StudyRecordDao get studyRecordDao; //dao 정의
}
