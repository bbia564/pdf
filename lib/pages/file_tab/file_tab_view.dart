import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_file/pages/file_first/file_first_view.dart';
import 'package:my_file/pages/file_second/file_second_view.dart';

import '../../main.dart';
import 'file_tab_logic.dart';

class FileTabPage extends GetView<FileTabLogic> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          FileFirstPage(),
          FileSecondPage()
        ],
      ),
      bottomNavigationBar: Obx(()=>_navFileBars()),
    );
  }

  Widget _navFileBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/item0Grey.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon: Image.asset('assets/item0Light.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle,color: primaryColor,size: 40,),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/item1Grey.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon: Image.asset('assets/item1Light.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Setting',
        ),
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        if (index == 1) {
          controller.pickPDfFile();
        } else {
          controller.currentIndex.value = index;
          controller.pageController.jumpToPage(index);
        }
      },
    );
  }
}
