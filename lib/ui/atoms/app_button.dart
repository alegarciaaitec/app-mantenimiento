import 'package:material_ui/material_ui.dart';

enum AppButtonStyle { filled, tonal, outlined, text }

/// Átomo "Botón" de Figma (y "Botón con icono" si se pasa [icon]).
/// `onPressed: null` lo deja deshabilitado.
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.style = AppButtonStyle.filled,
    this.icon,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonStyle style;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final text = Text(label);
    final icono = icon == null ? null : Icon(icon);
    return switch (style) {
      AppButtonStyle.filled => icono == null
          ? FilledButton(onPressed: onPressed, child: text)
          : FilledButton.icon(onPressed: onPressed, icon: icono, label: text),
      AppButtonStyle.tonal => icono == null
          ? FilledButton.tonal(onPressed: onPressed, child: text)
          : FilledButton.tonalIcon(
              onPressed: onPressed, icon: icono, label: text),
      AppButtonStyle.outlined => icono == null
          ? OutlinedButton(onPressed: onPressed, child: text)
          : OutlinedButton.icon(onPressed: onPressed, icon: icono, label: text),
      AppButtonStyle.text => icono == null
          ? TextButton(onPressed: onPressed, child: text)
          : TextButton.icon(onPressed: onPressed, icon: icono, label: text),
    };
  }
}
