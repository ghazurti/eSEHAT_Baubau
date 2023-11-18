import 'dart:convert';

import 'package:eSEHATBAUBAU/app/modules/panduan/models/PanduanModel.dart';
import 'package:get/get.dart';

import '../../../api/rest_api.dart';
import '../../../api/url.dart';

class PanduanController extends GetxController {
  //TODO: Implement PanduanController
  final _restApi = Get.put(RestApi());
  var listPanduan = <PanduanModel>[].obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    getPanduan();
    super.onReady();
  }

  @override
  void onClose() {}

  getPanduan() {
    Future.delayed(
      Duration.zero,
    );
    _restApi.getService(urlPanduan).then((value) => listPanduan.value =
        panduanModelFromJson(json.encode(value.body['data'])));
  }
}
