import 'package:akbarrm_mobileapps/features/main/di/di_object.dart';
import 'package:alice/alice.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

class AppLocator {
  static void initAlice(Alice alice) {
    /// Init Alice
    locator.registerFactory<Alice>(() => alice);
  }

  static void init() {
    /// Init all locator here
    MainLocator.init();
  }


  /// Alice getter
  static Alice get alice => locator();
}