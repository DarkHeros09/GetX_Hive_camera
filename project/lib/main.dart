import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

import './routes/app_pages.dart';
import './themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Directory doc = await getApplicationDocumentsDirectory();
  Hive.init(doc.path);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: appThemeData.primaryColor,
        accentColor: appThemeData.accentColor,
      ),
      getPages: AppPages.pages,
    );
  }
}
