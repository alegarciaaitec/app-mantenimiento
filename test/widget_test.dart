import 'package:app_mantenimiento/app.dart';
import 'package:app_mantenimiento/data/models/enums.dart';
import 'package:app_mantenimiento/ui/atoms/status_badge.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('StatusBadge muestra la etiqueta del estado', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: StatusBadge.equipo(EstadoEquipo.enMantenimiento),
      ),
    ));
    expect(find.text('En mantenimiento'), findsOneWidget);
  });

  testWidgets('la galería muestra los átomos y las moléculas', (tester) async {
    await tester.pumpWidget(const App());
    expect(find.text('Galería de diseño'), findsOneWidget);
    expect(find.text('Átomos · Botón'), findsOneWidget);

    // El filtro cambia de opción al tocar un chip.
    await tester.drag(find.byType(ListView), const Offset(0, -600));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(FilterChip, 'Operativos'));
    await tester.pumpAndSettle();
    final chip = tester.widget<FilterChip>(
      find.widgetWithText(FilterChip, 'Operativos'),
    );
    expect(chip.selected, isTrue);
  });
}
