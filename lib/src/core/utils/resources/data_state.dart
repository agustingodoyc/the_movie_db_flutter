import '../enums/state_enum.dart';

abstract class DataState<T> {
  final StateEnum state;
  final T? data;
  final Exception? error;

  const DataState({
    required this.state,
    this.data,
    this.error,
  });
}

class DataLoading<T> extends DataState<T> {
  const DataLoading() : super(state: StateEnum.loading);
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess({required T data})
      : super(
          state: StateEnum.success,
          data: data,
        );
}

class DataFailed<T> extends DataState<T> {
  const DataFailed({required Exception error})
      : super(
          state: StateEnum.failure,
          error: error,
        );
}
