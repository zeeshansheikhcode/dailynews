
import 'package:dailynews/model/news_model.dart';
import 'package:get/get.dart';


class DetailController extends GetxController
{
  late final Article currentPlaylist;

  @override
  void onInit() {
    super.onInit();
    currentPlaylist = Get.arguments;
  }
}