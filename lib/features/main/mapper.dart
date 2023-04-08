import 'package:akbarrm_mobileapps/features/main/data/models/food_data.dart';
import 'package:akbarrm_mobileapps/features/main/domain/entity/food_entity.dart';

extension FoodDataToEntity on FoodData {
  FoodEntity toEntity() => FoodEntity(
    foodCode: foodCode,
    name: name,
    picture: picture,
    price: price,
    pictureOri: pictureOri,
    createdAt: createdAt,
    id: id,
  );
}

extension FoodEntityToData on FoodEntity {
  FoodData toData() => FoodData.fromJsonMap({
    'food_code': foodCode,
    'name': name,
    'picture': picture,
    'price': price,
    'picture_ori': pictureOri,
    'created_at': createdAt,
    'id': id,
  });
}