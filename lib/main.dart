import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_file/db_file/db_file.dart';
import 'package:my_file/pages/file_first/file_first_binding.dart';
import 'package:my_file/pages/file_first/file_first_view.dart';
import 'package:my_file/pages/file_second/file_second_binding.dart';
import 'package:my_file/pages/file_second/file_second_view.dart';
import 'package:my_file/pages/file_tab/file_tab_binding.dart';
import 'package:my_file/pages/file_tab/file_tab_view.dart';

Color primaryColor = const Color(0xffdc2e1b);
Color bgColor = const Color(0xfff8f8f8);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DBFile().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Files,
      initialRoute: '/fileTab',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}

List<GetPage<dynamic>> Files = [
  GetPage(name: '/fileTab', page: () => FileTabPage(), binding: FileTabBinding()),
  GetPage(name: '/fileFirst', page: () => FileFirstPage(), binding: FileFirstBinding()),
  GetPage(name: '/fileSecond', page: () => FileSecondPage(), binding: FileSecondBinding()),
];
