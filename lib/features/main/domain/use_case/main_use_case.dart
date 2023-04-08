import 'package:akbarrm_mobileapps/core/util/resource.dart';
import 'package:akbarrm_mobileapps/features/main/data/models/main_query.dart';
import 'package:akbarrm_mobileapps/features/main/domain/entity/food_entity.dart';
import 'package:akbarrm_mobileapps/features/main/domain/repository/main_repository.dart';

class MainUseCase {
  final MainRepository repository;

  MainUseCase(this.repository);

  Future<Resource<List<FoodEntity>>> getAll() {
    return repository.getAll();
  }

  Future<Resource<List<FoodEntity>>> search(MainQuery query) {
    return repository.search(query);
  }
}