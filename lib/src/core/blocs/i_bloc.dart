abstract class IBloc {
  Future<void> initialize();

  Future<void> dispose();
}
