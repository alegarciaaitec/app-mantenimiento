import 'package:flutter/material.dart';

import 'spacing.dart';

/// Tema Material 3. Los colores salen de una sola semilla: el mismo valor
/// que se usó para generar las variables "Color" del archivo de Figma.
/// El tema oscuro se genera solo con `brightness: Brightness.dark`.
abstract final class AppTheme {
  static const seed = Color(0xFF0B5FA5);

  static ThemeData get light => _build(Brightness.light);
  static ThemeData get dark => _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: seed,
        brightness: brightness,
      ),
      // Campo de texto outlined con radio xs, como en Figma.
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(Radii.xs)),
        ),
      ),
    );
  }
}
