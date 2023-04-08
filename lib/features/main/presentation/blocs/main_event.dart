import 'package:akbarrm_mobileapps/features/main/data/models/food_data.dart';
import 'package:akbarrm_mobileapps/features/main/domain/entity/food_entity.dart';

abstract class MainEvent {}

class GetAllFood extends MainEvent {}

class SearchFood extends MainEvent {
  int id;

  SearchFood(this.id);
}

class AddToBag extends MainEvent {
  FoodEntity data;

  AddToBag(this.data);
}

class AddOrRemove extends MainEvent {
  FoodData data;
  bool isAdd;

  AddOrRemove(this.data, this.isAdd);
}