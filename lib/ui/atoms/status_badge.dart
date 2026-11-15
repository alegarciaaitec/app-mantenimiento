import 'package:material_ui/material_ui.dart';

import '../../core/theme/spacing.dart';
import '../../data/models/enums.dart';

enum BadgeTono { primario, secundario, terciario, error, neutro }

/// Átomo "Badge de estado" de Figma: etiqueta de solo lectura.
class StatusBadge extends StatelessWidget {
  const StatusBadge({super.key, required this.label, required this.tono});

  factory StatusBadge.equipo(EstadoEquipo estado) => StatusBadge(
        label: estado.label,
        tono: estado == EstadoEquipo.operativo
            ? BadgeTono.primario
            : BadgeTono.error,
      );

  factory StatusBadge.estadoMantenimiento(EstadoMantenimiento estado) =>
      StatusBadge(
        label: estado.label,
        tono: estado == EstadoMantenimiento.abierto
            ? BadgeTono.terciario
            : BadgeTono.neutro,
      );

  factory StatusBadge.tipo(TipoMantenimiento tipo) => StatusBadge(
        label: tipo.label,
        tono: tipo == TipoMantenimiento.preventivo
            ? BadgeTono.secundario
            : BadgeTono.error,
      );

  final String label;
  final BadgeTono tono;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final (fondo, texto) = switch (tono) {
      BadgeTono.primario => (cs.primaryContainer, cs.onPrimaryContainer),
      BadgeTono.secundario => (cs.secondaryContainer, cs.onSecondaryContainer),
      BadgeTono.terciario => (cs.tertiaryContainer, cs.onTertiaryContainer),
      BadgeTono.error => (cs.errorContainer, cs.onErrorContainer),
      BadgeTono.neutro => (cs.surfaceContainerHighest, cs.onSurfaceVariant),
    };
    return DecoratedBox(
      decoration: BoxDecoration(
        color: fondo,
        borderRadius: BorderRadius.circular(Radii.sm),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Spacing.md,
          vertical: Spacing.xs,
        ),
        child: Text(
          label,
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: texto),
        ),
      ),
    );
  }
}
