import '../tracking.dart';

class Marker {
  const Marker();

  void mark<T>(T data, [StackTrace? stack]) {
    Log.mark(data, stack);
  }
}
