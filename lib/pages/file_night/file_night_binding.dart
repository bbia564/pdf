import 'package:get/get.dart';

import 'file_night_logic.dart';

class FileNightBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
