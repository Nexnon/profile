import 'package:flutter/material.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:profile/features/profile/screens/interests_screen/interests_screen.dart';
import 'package:surf_flutter_test/surf_flutter_test.dart';

import '../test_screen_library.dart';

final Map<String, String> aboutMeData = {
  'aboutMe':'Я люблю автоматизировать',
};

final aboutMeStepDefinitions = [
  testerThen<FlutterWidgetTesterWorld>(
    RegExp(r'Я вижу экран данных о себе$'),
        (context, tester) async {
      await tester.pumpUntilVisible(aboutMeTestScreen.aboutMeScreen);
      expect(aboutMeTestScreen.aboutMeScreen, findsOneWidget);
    },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я указываю информацию о себе$'),
        (context, tester) async {
      await tester.implicitEnterText(aboutMeTestScreen.aboutMeTextField, aboutMeData['aboutMe']as String);
    },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я сохраняю данные$'),
        (context, tester) async {
      await tester.implicitTap(aboutMeTestScreen.saveBtn);
    },
  ),
  testerThen<FlutterWidgetTesterWorld>(
    RegExp(r'Я вижу указанную информацию о себе$'),
        (context, tester) async {
      await tester.pumpUntilVisible(aboutMeTestScreen.aboutMeScreen);
      final aboutMeText = tester.widget<TextFormField>(aboutMeTestScreen.aboutMeTextField);
      expect(aboutMeText.initialValue, aboutMeData['aboutMe']);
    },
  ),
];