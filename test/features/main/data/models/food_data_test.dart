import 'package:akbarrm_mobileapps/features/main/data/models/food_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final food = FoodData.fromJsonMap({
    'food_code': 'foodCode',
    'name': 'name',
    'picture': 'picture',
    'price': '1000',
    'picture_ori': 'pictureOri',
    'created_at': '2020-01-01 00:00:00',
    'id': 0,
  });

  test(
      'Given FoodData, '
      'When initialized, '
      'Then it should return correct data', () async {
    expect(food.foodCode, 'foodCode');
    expect(food.name, 'name');
    expect(food.picture, 'picture');
    expect(food.price, '1000');
    expect(food.pictureOri, 'pictureOri');
    expect(food.createdAt, '2020-01-01 00:00:00');
    expect(food.id, 0);
  });
}