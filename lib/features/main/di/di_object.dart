import 'package:akbarrm_mobileapps/di/di_object.dart';
import 'package:akbarrm_mobileapps/features/main/data/api/main_service.dart';
import 'package:akbarrm_mobileapps/features/main/data/data_source/main_data_source.dart';
import 'package:akbarrm_mobileapps/features/main/data/repository_impl/main_repository_impl.dart';
import 'package:akbarrm_mobileapps/features/main/domain/repository/main_repository.dart';
import 'package:akbarrm_mobileapps/features/main/domain/use_case/main_use_case.dart';
import 'package:akbarrm_mobileapps/features/main/presentation/blocs/main_bloc.dart';

class MainLocator {
  static void init() {
    /// Register service
    locator.registerFactory(() => MainService());

    /// Register data source
    locator.registerLazySingleton<MainDataSource>(() => MainDataSourceImpl(locator()));

    /// Register repository
    locator.registerLazySingleton<MainRepository>(() => MainRepositoryImpl(locator()));

    /// Register use case
    locator.registerFactory(() => MainUseCase(locator()));

    /// Register Bloc
    locator.registerFactory(() => MainBloc(locator()));
  }

  /// Bloc getter
  static MainBloc get bloc => locator();
}