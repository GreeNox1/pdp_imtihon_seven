import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pdp_imtihon_modul_seven/src/common/constants/constants.dart';
import 'package:pdp_imtihon_modul_seven/src/common/model/food_model.dart';
import 'package:pdp_imtihon_modul_seven/src/common/service/api_service.dart';

abstract interface class IHomeRepository {
  Future<List<FoodModel>?> getData(BuildContext context);
}

class ImpHomeRepository implements IHomeRepository {
  ApiService apiService = ApiService(
    dio: Dio(
      BaseOptions(
        baseUrl: Constants.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    ),
  );

  @override
  Future<List<FoodModel>> getData(BuildContext context) async {
    final data = await apiService.request(Urls.firstPath);

    final dataList = data["meals"] as List?;

    if (dataList == null) {
      return [];
    }

    List<FoodModel> foodList = [];

    for (int i = 0; i < dataList.length; i++) {
      foodList.add(FoodModel.fromJson(dataList[i]));
    }

    return foodList;
  }


}
