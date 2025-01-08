import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'file_first_logic.dart';

class FileFirstPage extends GetView<FileFirstLogic> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FileFirstLogic>(init: FileFirstLogic(),builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('My files'),
          actions: [
            const Text(
              'Select',
              style: TextStyle(fontWeight: FontWeight.bold),
            ).marginOnly(right: 20).gestures(onTap: () {
              controller.isEdit = !controller.isEdit;
              controller.selectedFiles.clear();
              controller.update();
            }),
            Visibility(
                visible: controller.isEdit,
                child: const Text(
                  'Delete',
                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),
                ).marginOnly(right: 20).gestures(onTap: () {
                  controller.deleteFiles();
                }))
          ],
        ),
        body: SafeArea(
            child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Obx(() {
            return controller.list.value.isEmpty
                ? <Widget>[
                    Image.asset(
                      'assets/noData.webp',
                      width: 47,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'No data',
                      style: TextStyle(color: Color(0xffdbdbdb)),
                    )
                  ].toColumn(mainAxisAlignment: MainAxisAlignment.center)
                : GridView.builder(
                    padding: const EdgeInsets.all(12),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 150 / 161),
                    itemCount: controller.list.value.length,
                    itemBuilder: (_, index) {
                      final entity = controller.list.value[index];
                      return Container(
                        padding: const EdgeInsets.all(12),
                        child: <Widget>[
                          const SizedBox(
                            width: double.infinity,
                            height: double.infinity,
                          ),
                          <Widget>[
                            Image.asset(
                              'assets/icon.webp',
                              width: 56,
                              height: 55,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              entity.name,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              entity.createdTimeString,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 12, color: Color(0xffbfbfbf)),
                            ),
                          ].toColumn(
                              mainAxisAlignment: MainAxisAlignment.center),
                          Visibility(
                              visible: controller.isEdit,
                              child: Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Icon(
                                    Icons.check_circle_rounded,
                                    size: 25,
                                    color: controller.selectedFiles
                                            .contains(entity)
                                        ? Colors.green
                                        : Colors.grey,
                                  )))
                        ].toStack(),
                      )
                          .decorated(
                              color: const Color(0xfffcfcfc),
                              borderRadius: BorderRadius.circular(12),
                              border:
                                  Border.all(color: const Color(0xffe0e0e0)))
                          .gestures(onTap: () {
                        if (controller.isEdit) {
                          if (controller.selectedFiles.contains(entity)) {
                            controller.selectedFiles.remove(entity);
                          } else {
                            controller.selectedFiles.add(entity);
                          }
                          controller.update();
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Scaffold(
                                appBar: AppBar(title: Text(entity.name)),
                                body: SafeArea(
                                  child: PDFView(
                                    filePath: entity.filePath,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                      });
                    });
          }),
        )
                .decorated(
                    color: Colors.white,
                    border: Border.all(color: const Color(0xffeaeaea)),
                    borderRadius: BorderRadius.circular(15))
                .marginAll(15)),
      );
    });
  }
}
