import 'package:akbarrm_mobileapps/core/util/resource.dart';
import 'package:akbarrm_mobileapps/features/main/domain/entity/food_entity.dart';
import 'package:akbarrm_mobileapps/features/main/domain/use_case/main_use_case.dart';
import 'package:akbarrm_mobileapps/features/main/presentation/blocs/main_bloc.dart';
import 'package:akbarrm_mobileapps/features/main/presentation/blocs/main_event.dart';
import 'package:akbarrm_mobileapps/features/main/presentation/blocs/main_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUseCase extends Mock implements MainUseCase {}

void main() {
  late MockUseCase useCase;

  setUpAll(() {
    useCase = MockUseCase();
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

  group('MainBloc tests', () {
    blocTest(
        'Given MainBloc, '
        'When get all success, '
        'Then it should emit Init', build: () => MainBloc(useCase),
      setUp: () {
        when(() => useCase.getAll())
            .thenAnswer((_) async => Resource.success(list));
      },
      act: (MainBloc bloc) => bloc.add(GetAllFood()),
      expect: () => [
        isA<ShowLoading>(),
        isA<Init>(),
      ],
    );

    blocTest(
      'Given MainBloc, '
      'When get all error, '
      'Then it should emit ShowError', build: () => MainBloc(useCase),
      setUp: () {
          when(() => useCase.getAll())
              .thenAnswer((_) async => Resource.error(""));
      },
      act: (MainBloc bloc) => bloc.add(GetAllFood()),
      expect: () => [
        isA<ShowLoading>(),
        isA<ShowError>()
      ],
    );
  });
}