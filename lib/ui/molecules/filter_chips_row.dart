import 'package:material_ui/material_ui.dart';

import '../../core/theme/spacing.dart';

/// Molécula "Fila de filtros" de Figma: un FilterChip por opción.
/// La clave `null` del mapa sirve para la opción "Todos".
class FilterChipsRow<T> extends StatelessWidget {
  const FilterChipsRow({
    super.key,
    required this.options,
    required this.selected,
    required this.onSelected,
  });

  final Map<T, String> options;
  final T selected;
  final ValueChanged<T> onSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: Spacing.sm,
        children: [
          for (final opcion in options.entries)
            FilterChip(
              label: Text(opcion.value),
              selected: opcion.key == selected,
              onSelected: (_) => onSelected(opcion.key),
            ),
        ],
      ),
    );
  }
}
