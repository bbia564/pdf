import 'package:get/get.dart';

import 'file_first_logic.dart';

class FileFirstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FileFirstLogic());
  }
}
