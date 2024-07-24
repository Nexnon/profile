import 'package:flutter/material.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:profile/features/profile/screens/interests_screen/interests_screen.dart';
import 'package:surf_flutter_test/surf_flutter_test.dart';

import '../screens/interests_test_screen.dart';
import '../test_screen_library.dart';

final interestsStepDefinitions = [
  testerThen<FlutterWidgetTesterWorld>(
    RegExp(r'Я вижу экран выбора интересов$'),
        (context, tester) async {
      await tester.pumpUntilVisible(interestsTestScreen.interestsScreen);
      expect(interestsTestScreen.interestsScreen, findsOneWidget);
    },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я указываю интересы$'),
        (context, tester) async {
      await tester.implicitTap(interestsTestScreen.photoChB);
      await tester.implicitTap(interestsTestScreen.designChB);
    },
  ),
  testerThen<FlutterWidgetTesterWorld>(
    RegExp(r'Я вижу указанные интересы$'),
        (context, tester) async {
      await tester.pumpUntilVisible(interestsTestScreen.interestsScreen);
      final photo = tester.widget<Checkbox>(interestsTestScreen.photoChB);
      expect(photo.value, true);
      final design = tester.widget<Checkbox>(interestsTestScreen.designChB);
      expect(design.value, true);
    },
  ),
];