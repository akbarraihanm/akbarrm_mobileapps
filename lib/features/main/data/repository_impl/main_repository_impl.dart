import 'dart:convert';

import 'package:akbarrm_mobileapps/core/const/app_string.dart';
import 'package:akbarrm_mobileapps/core/network/api_exception.dart';
import 'package:akbarrm_mobileapps/core/util/resource.dart';
import 'package:akbarrm_mobileapps/features/main/data/data_source/main_data_source.dart';
import 'package:akbarrm_mobileapps/features/main/data/models/main_query.dart';
import 'package:akbarrm_mobileapps/features/main/domain/entity/food_entity.dart';
import 'package:akbarrm_mobileapps/features/main/domain/repository/main_repository.dart';
import 'package:akbarrm_mobileapps/features/main/mapper.dart';

class MainRepositoryImpl implements MainRepository {
  final MainDataSource dataSource;

  MainRepositoryImpl(this.dataSource);

  @override
  Future<Resource<List<FoodEntity>>> getAll() async {
    try {
      final data = await dataSource.getAll();
      return Resource.success(data.map((e) => e.toEntity()).toList());
    } catch (ex) {
      if (ex is ErrorRequestException) {
        var message = jsonDecode(ex.errorBody);
        return Resource.error(message["message"]);
      } else if (ex is UnauthorizedException) {
        return Resource.unauthorized(AppString.unauthorizedMsg);
      } else if (ex is NetworkException) {
        return Resource.networkError("$ex");
      } else {
        return Resource.error("$ex");
      }
    }
  }

  @override
  Future<Resource<List<FoodEntity>>> search(MainQuery query) async {
    try {
      final data = await dataSource.search(query);
      return Resource.success(data.map((e) => e.toEntity()).toList());
    } catch (ex) {
      if (ex is ErrorRequestException) {
        var message = jsonDecode(ex.errorBody);
        return Resource.error(message["message"]);
      } else if (ex is UnauthorizedException) {
        return Resource.unauthorized(AppString.unauthorizedMsg);
      } else if (ex is NetworkException) {
        return Resource.networkError("$ex");
      } else {
        return Resource.error("$ex");
      }
    }
  }

}