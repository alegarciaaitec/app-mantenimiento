import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'ui/pages/inicio_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mantenimiento',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: const InicioPage(),
    );
  }
}
