// Mismos valores que los enums del schema.prisma de api-mantenimiento.
// `api` es el texto que viaja en el JSON; `label` es el que ve el usuario.

enum EstadoEquipo {
  operativo('OPERATIVO', 'Operativo'),
  enMantenimiento('EN_MANTENIMIENTO', 'En mantenimiento');

  const EstadoEquipo(this.api, this.label);
  final String api;
  final String label;
}

enum TipoMantenimiento {
  preventivo('PREVENTIVO', 'Preventivo'),
  correctivo('CORRECTIVO', 'Correctivo');

  const TipoMantenimiento(this.api, this.label);
  final String api;
  final String label;
}

enum EstadoMantenimiento {
  abierto('ABIERTO', 'Abierto'),
  cerrado('CERRADO', 'Cerrado');

  const EstadoMantenimiento(this.api, this.label);
  final String api;
  final String label;
}
