import 'package:app_mantenimiento/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('la app arranca con el tema Material 3', (tester) async {
    await tester.pumpWidget(const App());
    expect(find.text('Mantenimiento'), findsOneWidget);
    expect(find.byType(FilledButton), findsNWidgets(2)); // filled y tonal
  });
}
