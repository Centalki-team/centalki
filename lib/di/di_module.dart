import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

abstract class DIModule {
  Future<void> provides();
}
