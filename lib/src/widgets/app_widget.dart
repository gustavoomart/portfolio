import 'package:flutter/material.dart';
import 'package:portfolio/src/models/project_model.dart';
import 'package:portfolio/src/pages/portfolio_page.dart';
import 'package:portfolio/src/pages/project_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gustavo Martins',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
          dynamicSchemeVariant: DynamicSchemeVariant.tonalSpot,
          contrastLevel: 0.7,
        ),
        useMaterial3: true,
        chipTheme: ChipThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,

      routes: {'/': (context) => const PortfolioPage()},
      onGenerateRoute: (settings) {
        if (settings.name == '/project') {
          final project = settings.arguments as ProjectModel;
          return MaterialPageRoute(
            builder: (context) => ProjectPage(project: project),
          );
        }
        return null;
      },
    );
  }
}
