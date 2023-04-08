import 'package:akbarrm_mobileapps/core/util/resource.dart';
import 'package:akbarrm_mobileapps/features/main/data/models/main_query.dart';
import 'package:akbarrm_mobileapps/features/main/domain/entity/food_entity.dart';

abstract class MainRepository {
  Future<Resource<List<FoodEntity>>> getAll();
  Future<Resource<List<FoodEntity>>> search(MainQuery query);
}