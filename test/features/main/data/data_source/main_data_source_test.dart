import 'package:akbarrm_mobileapps/features/main/data/api/main_service.dart';
import 'package:akbarrm_mobileapps/features/main/data/data_source/main_data_source.dart';
import 'package:akbarrm_mobileapps/features/main/data/models/food_data.dart';
import 'package:akbarrm_mobileapps/features/main/data/models/main_query.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockService extends Mock implements MainService {}

void main() {
  late MockService service;
  late MainDataSource dataSource;

  setUpAll(() {
    service = MockService();
    dataSource = MainDataSourceImpl(service);
  });

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

  group('MainDataSource test', () {
    test(
        'Given MainDataSource'
            'When get all'
            'Then it should return correct list', () async {
      when(() => service.getAll()).thenAnswer((_) async => list);

      final result = await dataSource.getAll();
      expect(result, list);
    });

    test(
        'Given MainDataSource, '
        'When search food, '
        'Then it should return correct list', () async {
      when(() => service.search(query)).thenAnswer((_) async => list);

      final result = await dataSource.search(query);
      expect(result, list);
    });
  });
}