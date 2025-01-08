import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:my_file/db_file/db_file.dart';
import 'package:my_file/db_file/file_entity.dart';

class FileFirstLogic extends GetxController {

  DBFile dbFile = Get.find<DBFile>();

  var list = <FileEntity>[].obs;

  bool isEdit = false;
  List<FileEntity> selectedFiles = [];

  void getData() async {
    list.value = await dbFile.getFileAllData();
  }

  void deleteFiles() async {
    if (selectedFiles.isEmpty) {
      Fluttertoast.showToast(msg: 'Please select files to delete');
      return;
    }
    await dbFile.deleteFiles(selectedFiles);
    selectedFiles.clear();
    getData();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
