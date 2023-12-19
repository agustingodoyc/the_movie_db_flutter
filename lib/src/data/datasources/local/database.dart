import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../../core/utils/resources/converters/index.dart';
import '../../../domain/entities/index.dart';
import 'dao/index.dart';

part 'database.g.dart';

@Database(
  version: 1,
  entities: <Type>[
    MovieEntity,
    GenreEntity,
  ],
)
abstract class AppDatabase extends FloorDatabase {
  MovieDao get movieDao;

  GenreDao get genreDao;
}
