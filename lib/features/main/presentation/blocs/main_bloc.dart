import 'package:akbarrm_mobileapps/features/main/data/models/food_data.dart';
import 'package:akbarrm_mobileapps/features/main/data/models/main_query.dart';
import 'package:akbarrm_mobileapps/features/main/domain/entity/food_entity.dart';
import 'package:akbarrm_mobileapps/features/main/domain/use_case/main_use_case.dart';
import 'package:akbarrm_mobileapps/features/main/mapper.dart';
import 'package:akbarrm_mobileapps/features/main/presentation/blocs/main_event.dart';
import 'package:akbarrm_mobileapps/features/main/presentation/blocs/main_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final MainUseCase useCase;

  List<FoodEntity> foods = [];
  final searchCtrl = TextEditingController();
  List<FoodData> bag = [];
  double totalPrice = 0.0;
  int qty = 0;

  MainBloc(this.useCase): super(Init()) {
    on<GetAllFood>((event, emit) async {
      emit(ShowLoading());

      final result = await useCase.getAll();
      if (result.message != null) {
        emit(ShowError(result.message ?? ""));
      } else if (result.networkError != null) {
        emit(ShowError(result.networkError ?? ""));
      } else if (result.unauthorized != null) {
        emit(ShowUnauthorized(result.unauthorized ?? ""));
      } else {
        foods = result.data ?? [];
        emit(Init());
      }
    });

    on<SearchFood>((event, emit) async {
      final q = MainQuery(id: event.id);
      emit(ShowLoading());

      final result = await useCase.search(q);
      if (result.message != null) {
        emit(ShowError(result.message ?? ""));
      } else if (result.networkError != null) {
        emit(ShowError(result.networkError ?? ""));
      } else if (result.unauthorized != null) {
        emit(ShowUnauthorized(result.unauthorized ?? ""));
      } else {
        foods = result.data ?? [];
        emit(Init());
      }
    });

    on<AddToBag>((event, emit) {
      final data = event.data;
      final duplicated = bag.where((element) => element.id == data.toData().id);
      if (duplicated.isNotEmpty) {
        for (var e in bag) {
          if (e.id == data.id) {
            int qty = e.qty ?? 0;
            qty+=1;
            e.qty = qty;
          }
        }
      } else {
        final add = data.toData();
        add.qty = 1;
        bag.add(add);
      }
      count();
      emit(Init());
    });

    on<AddOrRemove>((event, emit) {
      final data = event.data;
      final duplicated = bag.where((element) => element.id == data.id);
      FoodData? deleted;
      if (duplicated.isNotEmpty) {
        for (var e in bag) {
          if (e.id == data.id) {
            if (event.isAdd) {
              int qty = e.qty ?? 0;
              qty+=1;
              e.qty = qty;
            } else {
              int qty = e.qty ?? 0;
              if (qty == 1) {
                deleted = e;
              } else if (qty > 0) {
                qty-=1;
                e.qty = qty;
              }
            }
          }
        }
      }
      if (deleted != null) bag.remove(deleted);
      count();
      emit(Init());
    });
  }

  void count() {
    totalPrice = 0;
    qty = 0;
    for (var e in bag) {
      final price = double.parse(e.price ?? "0.0");
      final qtyItem = e.qty ?? 0;
      totalPrice+=price*qtyItem;
      qty+=qtyItem;
    }
  }

}