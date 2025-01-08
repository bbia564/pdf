import 'package:get/get.dart';
import 'package:my_file/pages/file_first/file_first_logic.dart';
import 'package:my_file/pages/file_second/file_second_logic.dart';

import 'file_tab_logic.dart';

class FileTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FileTabLogic());
    Get.lazyPut(() => FileFirstLogic());
    Get.lazyPut(() => FileSecondLogic());
  }
}
