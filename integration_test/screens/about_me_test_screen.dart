import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:profile/features/profile/screens/about_me_screen/about_me_screen.dart';
import 'package:profile/features/profile/widgets/next_button.dart';

class AboutMeTestScreen {
  /// Экран
  final Finder aboutMeScreen = find.byType(AboutMeScreen);
  /// Текстовое поле
  final Finder aboutMeTextField = find.byWidgetPredicate((widget) => widget is TextFormField);
  /// Кнопка "save"
  final Finder saveBtn = find.byWidgetPredicate((widget) => widget is Text && widget.data == 'Save');
}
