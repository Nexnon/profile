import 'package:flutter/material.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:surf_flutter_test/surf_flutter_test.dart';

import '../test_screen_library.dart';

final Map<String, String> residenceData = {
  'city': 'Voronezh',
};

final placeOfResidenceStepDefinitions = [
  testerThen<FlutterWidgetTesterWorld>(
    RegExp(r'Я вижу экран заполнения города$'),
        (context, tester) async {
      await tester.pumpUntilVisible(placeOfResidenceTestScreen.residenceScreen);
      expect(placeOfResidenceTestScreen.residenceScreen, findsOneWidget);
    },
  ),
  testerThen<FlutterWidgetTesterWorld>(
    RegExp(r'Я выбираю город из списка$'),
        (context, tester) async {
      await tester.implicitEnterText(placeOfResidenceTestScreen.residenceField, residenceData['city']as String);
      await tester.implicitTap(placeOfResidenceTestScreen.listOfCities.first);
    },
  ),
  /// конструкция для поиска текста наэкране который мы ввели ранее
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я вижу указанный город$'),
        (context, tester) async {
      await tester.pumpUntilVisible(placeOfResidenceTestScreen.residenceScreen);
      final residence = tester.widget<TextFormField>(placeOfResidenceTestScreen.residenceField);
      expect(residence.initialValue, residenceData['city']);
    },
  ),

];
