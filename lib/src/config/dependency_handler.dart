import 'package:http/http.dart';

import '../data/index.dart';
import '../domain/use_cases/implementation/index.dart';
import '../presentation/blocs/movies_bloc.dart';

class DependencyHandler {
  static const String _databaseName = 'database.db';

  final Client _client = Client();

  late AppDatabase _appDatabase;
  late ApiService _apiService;
  late DatabaseRepository _databaseRepository;
  late Repository _repository;
  late MoviesUseCase _moviesUseCase;
  late GenresUseCase _genresUseCase;
  late MoviesBloc _moviesBloc;

  Future<void> initialize() async {
    _appDatabase =
        await $FloorAppDatabase.databaseBuilder(_databaseName).build();
    _apiService = ApiService(client: _client);
    _databaseRepository = DatabaseRepository(_appDatabase);
    _repository = Repository(apiService: _apiService);
    _moviesUseCase = MoviesUseCase(
      repository: _repository,
      databaseRepository: _databaseRepository,
    );
    _genresUseCase = GenresUseCase(
      repository: _repository,
      databaseRepository: _databaseRepository,
    );
    _moviesBloc = MoviesBloc(
      genresUseCase: _genresUseCase,
      moviesUseCase: _moviesUseCase,
    );
    await _moviesBloc.initialize();
  }

  AppDatabase get moviesDatabase => _appDatabase;

  ApiService get apiService => _apiService;

  DatabaseRepository get databaseRepository => _databaseRepository;

  Repository get repository => _repository;

  MoviesUseCase get moviesUseCase => _moviesUseCase;

  GenresUseCase get genresUseCase => _genresUseCase;

  MoviesBloc get moviesBloc => _moviesBloc;
}
