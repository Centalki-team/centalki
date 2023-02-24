import '../module/repositories_module.dart';

class Injection {
  static Future inject() async {
    //await ComponentsModule().provides();
    await RepositoriesModule().provides();
  }
}
