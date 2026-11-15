import 'package:material_ui/material_ui.dart';

import 'core/theme/app_theme.dart';
import 'ui/pages/galeria_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mantenimiento',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: const GaleriaPage(),
    );
  }
}
