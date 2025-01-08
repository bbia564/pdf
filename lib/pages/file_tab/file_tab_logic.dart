import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:my_file/db_file/db_file.dart';
import 'package:my_file/db_file/file_entity.dart';

import '../file_first/file_first_logic.dart';

class FileTabLogic extends GetxController {
  DBFile dbFile = Get.find<DBFile>();

  PageController pageController = PageController();
  var currentIndex = 0.obs;

  void pickPDfFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      await dbFile.insertFile(FileEntity(
          id: 0,
          createdTime: DateTime.now(),
          name: result.files.single.name,
          filePath: result.files.single.path!));
      FileFirstLogic fileFirstLogic = Get.put(FileFirstLogic());
      fileFirstLogic.getData();
      Fluttertoast.showToast(msg: 'File added successfully');
    } else {
      return null;
    }
  }
}
