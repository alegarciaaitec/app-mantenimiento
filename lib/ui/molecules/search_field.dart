import 'package:material_ui/material_ui.dart';

/// Molécula "Barra de búsqueda" de Figma (SearchBar de M3).
class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    this.hint = 'Buscar',
    this.onChanged,
    this.controller,
  });

  final String hint;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: controller,
      hintText: hint,
      leading: const Icon(Icons.search),
      onChanged: onChanged,
      elevation: const WidgetStatePropertyAll(0),
    );
  }
}
