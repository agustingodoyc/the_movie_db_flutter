// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

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

  MovieDao? _movieDaoInstance;

  GenreDao? _genreDaoInstance;

  FavoriteDao? _favoriteDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
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
            'CREATE TABLE IF NOT EXISTS `movies` (`adult` INTEGER, `backdropPath` TEXT, `genreIds` TEXT NOT NULL, `id` INTEGER, `originalLanguage` TEXT, `originalTitle` TEXT, `overview` TEXT, `popularity` REAL, `posterPath` TEXT, `releaseDate` TEXT, `title` TEXT, `video` INTEGER, `voteAverage` REAL, `voteCount` INTEGER, `category` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `genres` (`id` INTEGER, `name` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `favorite_movies` (`id` INTEGER, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MovieDao get movieDao {
    return _movieDaoInstance ??= _$MovieDao(database, changeListener);
  }

  @override
  GenreDao get genreDao {
    return _genreDaoInstance ??= _$GenreDao(database, changeListener);
  }

  @override
  FavoriteDao get favoriteDao {
    return _favoriteDaoInstance ??= _$FavoriteDao(database, changeListener);
  }
}

class _$MovieDao extends MovieDao {
  _$MovieDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _movieEntityInsertionAdapter = InsertionAdapter(
            database,
            'movies',
            (MovieEntity item) => <String, Object?>{
                  'adult': item.adult == null ? null : (item.adult! ? 1 : 0),
                  'backdropPath': item.backdropPath,
                  'genreIds': _genreIdList.encode(item.genreIds),
                  'id': item.id,
                  'originalLanguage': item.originalLanguage,
                  'originalTitle': item.originalTitle,
                  'overview': item.overview,
                  'popularity': item.popularity,
                  'posterPath': item.posterPath,
                  'releaseDate': item.releaseDate,
                  'title': item.title,
                  'video': item.video == null ? null : (item.video! ? 1 : 0),
                  'voteAverage': _nullableNum.encode(item.voteAverage),
                  'voteCount': item.voteCount,
                  'category': _stringList.encode(item.category)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<MovieEntity> _movieEntityInsertionAdapter;

  @override
  Future<List<MovieEntity>> findMovies(String endpoint) async {
    return _queryAdapter.queryList(
        'SELECT * FROM movies WHERE category LIKE \'%\' || ?1 || \'%\'',
        mapper: (Map<String, Object?> row) => MovieEntity(
            adult: row['adult'] == null ? null : (row['adult'] as int) != 0,
            backdropPath: row['backdropPath'] as String?,
            genreIds: _genreIdList.decode(row['genreIds'] as String),
            id: row['id'] as int?,
            originalLanguage: row['originalLanguage'] as String?,
            originalTitle: row['originalTitle'] as String?,
            overview: row['overview'] as String?,
            popularity: row['popularity'] as double?,
            posterPath: row['posterPath'] as String?,
            releaseDate: row['releaseDate'] as String?,
            title: row['title'] as String?,
            video: row['video'] == null ? null : (row['video'] as int) != 0,
            voteAverage: _nullableNum.decode(row['voteAverage'] as double?),
            voteCount: row['voteCount'] as int?,
            category: _stringList.decode(row['category'] as String)),
        arguments: [endpoint]);
  }

  @override
  Future<void> insertMovie(MovieEntity movie) async {
    await _movieEntityInsertionAdapter.insert(
        movie, OnConflictStrategy.replace);
  }
}

class _$GenreDao extends GenreDao {
  _$GenreDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _genreEntityInsertionAdapter = InsertionAdapter(
            database,
            'genres',
            (GenreEntity item) =>
                <String, Object?>{'id': item.id, 'name': item.name});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<GenreEntity> _genreEntityInsertionAdapter;

  @override
  Future<List<GenreEntity>> findGenres() async {
    return _queryAdapter.queryList('SELECT * FROM genres',
        mapper: (Map<String, Object?> row) =>
            GenreEntity(id: row['id'] as int?, name: row['name'] as String?));
  }

  @override
  Future<void> insertGenre(GenreEntity genre) async {
    await _genreEntityInsertionAdapter.insert(
        genre, OnConflictStrategy.replace);
  }
}

class _$FavoriteDao extends FavoriteDao {
  _$FavoriteDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _favoriteEntityInsertionAdapter = InsertionAdapter(
            database,
            'favorite_movies',
            (FavoriteEntity item) => <String, Object?>{'id': item.id}),
        _favoriteEntityDeletionAdapter = DeletionAdapter(
            database,
            'favorite_movies',
            ['id'],
            (FavoriteEntity item) => <String, Object?>{'id': item.id});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<FavoriteEntity> _favoriteEntityInsertionAdapter;

  final DeletionAdapter<FavoriteEntity> _favoriteEntityDeletionAdapter;

  @override
  Future<List<FavoriteEntity>> findFavoriteMovies() async {
    return _queryAdapter.queryList('SELECT * FROM favorite_movies',
        mapper: (Map<String, Object?> row) =>
            FavoriteEntity(id: row['id'] as int?));
  }

  @override
  Future<FavoriteEntity?> findFavoriteById(int id) async {
    return _queryAdapter.query('SELECT * FROM favorite_movies WHERE id = ?1',
        mapper: (Map<String, Object?> row) =>
            FavoriteEntity(id: row['id'] as int?),
        arguments: [id]);
  }

  @override
  Future<void> insertFavorite(FavoriteEntity favorite) async {
    await _favoriteEntityInsertionAdapter.insert(
        favorite, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteFavorite(FavoriteEntity favorite) async {
    await _favoriteEntityDeletionAdapter.delete(favorite);
  }
}

// ignore_for_file: unused_element
final _genreIdList = GenreIdList();
final _nullableNum = NullableNum();
final _stringList = StringList();
