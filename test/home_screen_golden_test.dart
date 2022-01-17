import 'dart:ui';

import 'package:budget_app/ui/home_screen/home_screen.dart';
import 'package:budget_app/ui/home_screen/home_wm.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';

void main(){
  const widget = HomeScreen();
  late HomeWM wm;

  setUp(() {
    wm = HomeWMMock();
    when(() => wm.budgetValNotifier).thenReturn(ValueNotifier(0));
    when(() => wm.inputValNotifier).thenReturn(ValueNotifier(''));
  });

  testGoldens('Home screen should look correct', (tester) async {

    await tester.pumpWidgetBuilder(
      widget.build(wm),
      surfaceSize: const Size(400, 800),
    );

    await screenMatchesGolden(tester, 'home_screen_input_empty');
  });

  testGoldens('Input value on home screen should be 100', (tester) async {
    when(() => wm.inputValNotifier).thenReturn(ValueNotifier('100'));

    await tester.pumpWidgetBuilder(
      widget.build(wm),
      surfaceSize: const Size(400, 800),
    );

    await screenMatchesGolden(tester, 'home_screen_input_with_value');
  });
}

class HomeWMMock extends MockWM implements HomeWM {}

abstract class MockWM extends Mock with Diagnosticable {}
