import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:profile/assets/strings/place_residence_screen_strings.dart';
import 'package:profile/assets/strings/test_keys.dart';
import 'package:profile/features/profile/screens/interests_screen/interests_screen.dart';
import 'package:profile/features/profile/screens/place_residence/place_residence_screen.dart';


class InterestsTestScreen {
  /// Экран
  final Finder interestsScreen = find.byType(InterestsScreen);
  /// Увлечения
  final Finder photoChB = find.descendant(of: find.ancestor(of: find.text('Photo'), matching: find.byType(Row)), matching: find.byType(Checkbox));
  final Finder designChB = find.descendant(of: find.ancestor(of: find.text('Design'), matching: find.byType(Row)), matching: find.byType(Checkbox));
}
