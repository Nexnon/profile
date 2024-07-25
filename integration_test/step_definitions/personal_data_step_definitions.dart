import 'package:flutter/material.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:surf_flutter_test/surf_flutter_test.dart';

import '../test_screen_library.dart';

/// Добавил мапу со значениями для тестирования приложения
/// Если нужно использовать другой датасет, то менять значения нужно только в одном месте
final Map<String, String> personalData = {
  'surname': 'Gosling',
  'name': 'Ryan',
  'secondName': 'Nicolaevich',
  'birthday': '2000-01-01',
};

final personalDataStepDefinitions = [
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я указываю фамилию$'),
    (context, tester) async {
      await tester.implicitEnterText(
          personalDataTestScreen.surnameField, personalData['surname']as String,);
    },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я указываю дату рождения$'),
    (context, tester) async {
      final calendar =
          tester.widget<TextFormField>(personalDataTestScreen.dateOfBirthField);
      calendar.controller?.text = personalData['birthday'] as String;
    },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я указываю имя$'),
        (context, tester) async {
      await tester.implicitEnterText(personalDataTestScreen.nameField, personalData['name']as String,);
    },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я указываю отчество$'),
        (context, tester) async {
      await tester.implicitEnterText(personalDataTestScreen.secondName, personalData['secondName']as String,);
    },
  ),
  testerThen<FlutterWidgetTesterWorld>(
    RegExp(r'Я вижу указанные ФИО$'),
        (context, tester) async {
      await tester.pumpUntilVisible(personalDataTestScreen.trait);
      final surname = tester.widget<TextFormField>(personalDataTestScreen.surnameField);
      expect(surname.initialValue, personalData['surname']);
      final name = tester.widget<TextFormField>(personalDataTestScreen.nameField);
      expect(name.initialValue, personalData['name']);
      final secondName = tester.widget<TextFormField>(personalDataTestScreen.secondName);
      expect(secondName.initialValue, personalData['secondName']);
    },
  ),
  testerThen<FlutterWidgetTesterWorld>(
    RegExp(r'Я вижу указанную дату рождения$'),
        (context, tester) async {
      final dateOfBirth = tester.widget<TextFormField>(personalDataTestScreen.dateOfBirthField);
      expect(dateOfBirth.initialValue, personalData['birthday']);
    },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я удаляю имя$'),
        (context, tester) async {
      final name = tester.widget<TextFormField>(personalDataTestScreen.nameField);
      name.controller?.text = '';
    },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я удаляю отчество$'),
        (context, tester) async {
      final secondName = tester.widget<TextFormField>(personalDataTestScreen.secondName);
      secondName.controller?.text = '';
    },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я удаляю дату рождения$'),
        (context, tester) async {
      final calendar =
      tester.widget<TextFormField>(personalDataTestScreen.dateOfBirthField);
      calendar.controller?.text = '';
    },
  ),
  testerThen<FlutterWidgetTesterWorld>(
    RegExp(r'Я вижу пустое поле фамилии$'),
        (context, tester) async {
      await tester.pumpUntilVisible(personalDataTestScreen.surnameError);
      expect(personalDataTestScreen.surnameError, findsOneWidget);
    },
  ),
  testerThen<FlutterWidgetTesterWorld>(
    RegExp(r'Я вижу пустое поле имени$'),
        (context, tester) async {
      await tester.pumpUntilVisible(personalDataTestScreen.nameError);
      expect(personalDataTestScreen.nameError, findsOneWidget);
    },
  ),
  testerThen<FlutterWidgetTesterWorld>(
    RegExp(r'Я вижу пустое поле даты рождения$'),
        (context, tester) async {
      await tester.pumpUntilVisible(personalDataTestScreen.dateOfBirthError);
      expect(personalDataTestScreen.dateOfBirthError, findsOneWidget);
    },
  ),
];
