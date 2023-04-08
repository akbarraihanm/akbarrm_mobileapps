import 'package:akbarrm_mobileapps/core/network/base_api_service.dart';
import 'package:akbarrm_mobileapps/core/network/http_helper.dart';
import 'package:akbarrm_mobileapps/core/network/url_helper.dart';
import 'package:akbarrm_mobileapps/features/main/data/models/food_data.dart';
import 'package:akbarrm_mobileapps/features/main/data/models/main_query.dart';

class MainService extends HttpHelper with BaseApiService {
  Future<List<FoodData>> getAll() async {
    final map = await getMethod(URL.allRecord(), token());
    return List.from(map.map((it) => FoodData.fromJsonMap(it)));
  }

  Future<List<FoodData>> search(MainQuery query) async {
    final map = await getMethod(URL.allRecord(query), token());
    return List.from(map.map((it) => FoodData.fromJsonMap(it)));
  }
}