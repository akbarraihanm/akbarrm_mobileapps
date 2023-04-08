import 'package:akbarrm_mobileapps/core/util/resource.dart';
import 'package:akbarrm_mobileapps/features/main/data/models/main_query.dart';
import 'package:akbarrm_mobileapps/features/main/domain/entity/food_entity.dart';
import 'package:akbarrm_mobileapps/features/main/domain/repository/main_repository.dart';
import 'package:akbarrm_mobileapps/features/main/domain/use_case/main_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRepo extends Mock implements MainRepository {}

void main() {
  late MockRepo repo;
  late MainUseCase useCase;

  setUpAll(() {
    repo = MockRepo();
    useCase = MainUseCase(repo);
  });

  final list = [
    FoodEntity(
      foodCode: 'foodCode',
      name: 'name',
      picture: 'picture',
      price: '1000',
      pictureOri: 'pictureOri',
      createdAt: '2020-01-01 00:00:00',
      id: 0,
    )
  ];

  final query = MainQuery(id: 0);

  group('MainUseCase test', () {
    test(
        'Given MainUseCase, '
            'When get all records, '
            'Then it should return correct data', () async {
      when(() => repo.getAll()).thenAnswer((_) async => Resource.success(list));

      final result = await useCase.getAll();
      expect(result.data, list);
    });

    test(
        'Given MainUseCase, '
        'When search data, '
        'Then it should return correct data', () async {
      when(() => repo.search(query))
          .thenAnswer((invocation) async => Resource.success(list));

      final result = await useCase.search(query);
      expect(result.data, list);
    });
  });
}