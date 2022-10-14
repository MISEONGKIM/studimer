// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  StudyRecordDao? _studyRecordDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `log_studimer` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `cycleRepeat` INTEGER NOT NULL, `regTime` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  StudyRecordDao get studyRecordDao {
    return _studyRecordDaoInstance ??=
        _$StudyRecordDao(database, changeListener);
  }
}

class _$StudyRecordDao extends StudyRecordDao {
  _$StudyRecordDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _studyRecordInsertionAdapter = InsertionAdapter(
            database,
            'log_studimer',
            (StudyRecord item) => <String, Object?>{
                  'id': item.id,
                  'cycleRepeat': item.cycleRepeat,
                  'regTime': item.regTime
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<StudyRecord> _studyRecordInsertionAdapter;

  @override
  Future<List<StudyRecord>> getStudyRecordByMonth(
      String startTime, String endTime) async {
    return _queryAdapter.queryList(
        'SELECT * FROM log_studimer Where regTime BETWEEN ?1 AND ?2',
        mapper: (Map<String, Object?> row) => StudyRecord(row['id'] as int?,
            regTime: row['regTime'] as String,
            cycleRepeat: row['cycleRepeat'] as int),
        arguments: [startTime, endTime]);
  }

  @override
  Future<void> insertStudyRecord(StudyRecord record) async {
    await _studyRecordInsertionAdapter.insert(
        record, OnConflictStrategy.replace);
  }
}
