import 'package:akbarrm_mobileapps/features/main/domain/entity/food_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final data = FoodEntity(
    foodCode: 'foodCode',
    name: 'name',
    picture: 'picture',
    price: '1000',
    pictureOri: 'pictureOri',
    createdAt: '2020-01-01 00:00:00',
    id: 0,
  );

  test(
      'Given Food Entity, '
      'When initialized, '
      'Then it should return correct data', () {
    expect(data.foodCode, 'foodCode');
    expect(data.name, 'name');
    expect(data.picture, 'picture');
    expect(data.pictureOri, 'pictureOri');
    expect(data.createdAt, '2020-01-01 00:00:00');
    expect(data.price, '1000');
    expect(data.id, 0);
  });
}