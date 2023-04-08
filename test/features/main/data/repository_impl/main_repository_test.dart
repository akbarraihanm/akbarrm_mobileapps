import 'package:akbarrm_mobileapps/features/main/data/data_source/main_data_source.dart';
import 'package:akbarrm_mobileapps/features/main/data/models/food_data.dart';
import 'package:akbarrm_mobileapps/features/main/data/models/main_query.dart';
import 'package:akbarrm_mobileapps/features/main/data/repository_impl/main_repository_impl.dart';
import 'package:akbarrm_mobileapps/features/main/domain/entity/food_entity.dart';
import 'package:akbarrm_mobileapps/features/main/domain/repository/main_repository.dart';
import 'package:akbarrm_mobileapps/features/main/mapper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDataSource extends Mock implements MainDataSource {}

void main() {
  late MockDataSource dataSource;
  late MainRepository repository;

  setUpAll(() {
    dataSource = MockDataSource();
    repository = MainRepositoryImpl(dataSource);
  });

  final entityList = [
    FoodEntity(
      foodCode: 'foodCode',
      name: 'name',
      picture: 'picture',
      price: '1000',
      pictureOri: 'pictureOri',
      createdAt: '2020-02-02 00:00:00',
      id: 0,
    ),
  ];

  final list = [
    FoodData.fromJsonMap({
      'food_code': 'foodCode',
      'name': 'name',
      'picture': 'picture',
      'price': '1000',
      'picture_ori': 'pictureOri',
      'created_at': '2020-02-02 00:00:00',
      'id': 0,
    }),
  ];

  final query = MainQuery(id: 0);

  group('MainRepository test', () {
    test(
        'Given MainRepository, '
            'When get all data, '
            'Then it should return correct list', () async {
      when(() => dataSource.getAll()).thenAnswer((_) async => list);

      final result = await repository.getAll();
      final entityData = result.data?.first ?? entityList.first;
      final data = list.first;

      expect(entityData.id, data.toEntity().id);
      expect(entityData.price, data.toEntity().price);
      expect(entityData.createdAt, data.toEntity().createdAt);
    });

    test(
        'Given MainRepository, '
        'When search data, '
        'Then it should return correct list', () async {
      when(() => dataSource.search(query)).thenAnswer((invocation) async => list);

      final result = await repository.search(query);
      final entityData = result.data?.first ?? entityList.first;
      final data = list.first;

      expect(entityData.id, data.toEntity().id);
      expect(entityData.price, data.toEntity().price);
      expect(entityData.createdAt, data.toEntity().createdAt);
    });
  });
}