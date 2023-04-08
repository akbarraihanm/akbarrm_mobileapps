import 'package:akbarrm_mobileapps/features/main/data/models/main_query.dart';

class URL {
  static const String _baseUrl = "https://apigenerator.dronahq.com/api/g7s7P925/TestAlan";
  static String allRecord([MainQuery? query]) => "$_baseUrl${query?.toQuery() ?? ""}";
}
