// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:the_translation_app/view/screens/onboarding.dart';
import 'controller/localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'navigatoin.dart';

int? isviewed;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  isviewed = preferences.getInt('isviewed');
  await preferences.setInt('isviewed', 1);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'translation',
      translations: Language(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      initialRoute:
          isviewed == 0 || isviewed == null ? 'onboarding' : 'Textscreen',
      routes: {
        'Textscreen': (context) => const NavigationSc(),
        'onboarding': (context) => const OnboardingSc1(),
      },
    );
  }
}
