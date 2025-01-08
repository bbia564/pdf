import 'package:get/get.dart';

import 'file_second_logic.dart';

class FileSecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FileSecondLogic());
  }
}
