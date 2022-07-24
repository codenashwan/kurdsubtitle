import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MovieApi extends GetConnect with ChangeNotifier {
  String api;
  MovieApi(this.api);
  final storage = GetStorage();
  late Map movie = {};

  bool load = false;

  void toggleLoading() {
    load = !load;
    notifyListeners();
  }

  void fetch(id) async {
    toggleLoading();
    var response = await get(
      "${api}movies/$id",
    );

    movie = response.body['data'];

    toggleLoading();
  }
}
