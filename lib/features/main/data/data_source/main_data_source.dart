import 'package:akbarrm_mobileapps/features/main/data/api/main_service.dart';
import 'package:akbarrm_mobileapps/features/main/data/models/food_data.dart';
import 'package:akbarrm_mobileapps/features/main/data/models/main_query.dart';

abstract class MainDataSource {
  Future<List<FoodData>> getAll();
  Future<List<FoodData>> search(MainQuery query);
}

class MainDataSourceImpl implements MainDataSource {
  final MainService service;

  MainDataSourceImpl(this.service);

  @override
  Future<List<FoodData>> getAll() {
    return service.getAll();
  }

  @override
  Future<List<FoodData>> search(MainQuery query) {
    return service.search(query);
  }

}