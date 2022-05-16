import 'package:flutter_banglore_test/network.dart';
import 'package:flutter_banglore_test/reaction_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var model = FeelingPercentage().obs;
  var video = VideoArr().obs;

  @override
  void onInit() {
    fetch();
    super.onInit();
  }

  fetch() async {
    isLoading.value = true;
    var res = await Api.getApi();
    model.value = res.feelingPercentage!;
    res.videoArr!.forEach((element) {
      if (element != null) {
         video.value = element;
      }
    });
   // video.value = res.videoArr!;
    isLoading.value = false;
    update();
  }
}
