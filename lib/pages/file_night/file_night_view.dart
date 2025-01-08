import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'file_night_logic.dart';

class FileNightView extends GetView<PageLogic> {
  const FileNightView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.larson.value
              ? const CircularProgressIndicator(color: Colors.red)
              : buildError(),
        ),
      ),
    );
  }

  Widget buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              controller.ohcmp();
            },
            icon: const Icon(
              Icons.restart_alt,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
