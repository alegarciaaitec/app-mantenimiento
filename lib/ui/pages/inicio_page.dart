import 'package:flutter/material.dart';

import '../../core/theme/spacing.dart';

/// Primera pantalla: sirve para ver el tema Material 3 en acción.
/// Cambia la semilla en app_theme.dart y mira cómo cambian los colores.
class InicioPage extends StatelessWidget {
  const InicioPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Mantenimiento')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: Spacing.lg,
          children: [
            Icon(Icons.build_circle, size: 72, color: theme.colorScheme.primary),
            Text('Material 3', style: theme.textTheme.headlineMedium),
            FilledButton(onPressed: () {}, child: const Text('Filled')),
            FilledButton.tonal(onPressed: () {}, child: const Text('Tonal')),
            OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
            TextButton(onPressed: () {}, child: const Text('Text')),
          ],
        ),
      ),
    );
  }
}
