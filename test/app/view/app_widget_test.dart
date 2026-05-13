import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_boilerplate/app/shared/wrapper/localization_wrapper.dart';
import 'package:flutter_boilerplate/app/shared/wrapper/state_wrapper.dart';
import 'package:flutter_boilerplate/app_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    await EasyLocalization.ensureInitialized();
  });

  testWidgets('should render AppWidget with required wrappers', (tester) async {
    await tester.pumpWidget(
      const LocalizationWrapper(child: StateWrapper(child: AppWidget())),
    );

    await tester.pumpAndSettle();

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
