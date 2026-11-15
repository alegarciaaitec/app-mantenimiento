import 'package:material_ui/material_ui.dart';

import '../../core/theme/spacing.dart';
import '../../data/models/enums.dart';
import '../atoms/app_button.dart';
import '../atoms/app_text_field.dart';
import '../atoms/status_badge.dart';
import '../molecules/app_snack_bar.dart';
import '../molecules/filter_chips_row.dart';
import '../molecules/search_field.dart';

/// Catálogo vivo de componentes, en el orden de Atomic Design.
/// Sirve para comparar la app con el archivo de Figma.
class GaleriaPage extends StatefulWidget {
  const GaleriaPage({super.key});

  @override
  State<GaleriaPage> createState() => _GaleriaPageState();
}

class _GaleriaPageState extends State<GaleriaPage> {
  EstadoEquipo? _filtro;

  Widget _seccion(String titulo, Widget hijo) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: Spacing.md,
        children: [
          Text(titulo, style: Theme.of(context).textTheme.titleLarge),
          hijo,
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Galería de diseño')),
      body: ListView(
        padding: const EdgeInsets.all(Spacing.lg),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: Spacing.xxl,
            children: [
              _seccion(
                'Átomos · Botón',
                Wrap(
                  spacing: Spacing.sm,
                  runSpacing: Spacing.sm,
                  children: [
                    for (final s in AppButtonStyle.values) ...[
                      AppButton(label: s.name, style: s, onPressed: () {}),
                      AppButton(label: s.name, style: s, onPressed: null),
                    ],
                    AppButton(label: 'Con icono', icon: Icons.add, onPressed: () {}),
                  ],
                ),
              ),
              _seccion(
                'Átomos · Badge de estado',
                Wrap(
                  spacing: Spacing.sm,
                  runSpacing: Spacing.sm,
                  children: [
                    for (final e in EstadoEquipo.values) StatusBadge.equipo(e),
                    for (final e in EstadoMantenimiento.values)
                      StatusBadge.estadoMantenimiento(e),
                    for (final t in TipoMantenimiento.values) StatusBadge.tipo(t),
                  ],
                ),
              ),
              _seccion(
                'Átomos · Campo de texto',
                const AppTextField(
                  label: 'Nombre del equipo',
                  helper: 'Texto de ayuda',
                ),
              ),
              _seccion(
                'Moléculas · Barra de búsqueda',
                const SearchField(hint: 'Buscar equipo'),
              ),
              _seccion(
                'Moléculas · Fila de filtros',
                FilterChipsRow<EstadoEquipo?>(
                  options: const {
                    null: 'Todos',
                    EstadoEquipo.operativo: 'Operativos',
                    EstadoEquipo.enMantenimiento: 'En mantenimiento',
                  },
                  selected: _filtro,
                  onSelected: (v) => setState(() => _filtro = v),
                ),
              ),
              _seccion(
                'Moléculas · Snackbar',
                AppButton(
                  label: 'Mostrar snackbar',
                  style: AppButtonStyle.tonal,
                  onPressed: () => showAppSnackBar(
                    context,
                    'Equipo guardado',
                    actionLabel: 'Deshacer',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
