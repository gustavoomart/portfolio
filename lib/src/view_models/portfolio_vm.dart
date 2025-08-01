import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/src/models/education_model.dart';
import 'package:portfolio/src/models/project_model.dart';

class PortfolioViewModel {
  final projects = ValueNotifier([]);
  final aboutMe = ValueNotifier('');
  final String baseUrl = 'https://github.com/gustavoomart';
  final int nodeCount = 120;
  final double connectionDistance = 120;
  final double animationSpeed = 0.2;

  final educations = [
    EducationModel(
      institution: 'Della Sul',
      city: 'Tubarão',
      title: 'Informática / Programação',
      description:
          'Java, Delphi, Flash, CSS, HTML, Dreamweaver e Pacote Office completo.',
      period: DateTimeRange(start: DateTime(2012, 1), end: DateTime(2014, 12)),
    ),
    EducationModel(
      institution: 'Della Sul',
      city: 'Tubarão',
      title: 'Design Gráfico',
      description: 'Adobe Photoshop, Illustrator, CorelDraw e Web.',
      period: DateTimeRange(start: DateTime(2012, 1), end: DateTime(2014, 12)),
    ),
    EducationModel(
      institution: 'CNI',
      city: 'Tubarão',
      title: 'Manutenção & Redes',
      description:
          'Conceitos fundamentais de eletrônica e lógica, Hardware e Software, arquitetura, portas lógicas, protocolos e redes.',
      period: DateTimeRange(start: DateTime(2018, 1), end: DateTime(2019, 12)),
    ),
    EducationModel(
      institution: 'CNI',
      city: 'Tubarão',
      title: 'Gestor Administrativo',
      description:
          'Excel Avançado, Secretariado, Contabilidade, Departamento Pessoal, Matemática Financeira e Telemarketing & Técnicas em Vendas.',
      period: DateTimeRange(start: DateTime(2018, 1), end: DateTime(2019, 12)),
    ),
    EducationModel(
      institution: 'UNISUL',
      city: 'Tubarão',
      title: 'Engenharia Química',
      description: 'Bacharelado.',
      period: DateTimeRange(start: DateTime(2019, 1), end: DateTime(2025, 1)),
    ),
    EducationModel(
      institution: 'SENAC',
      city: 'Tubarão',
      title: 'Jovem Programador',
      description:
          'Desenvolver Sistemas de Informação, Programador de Sistemas, Programador Web, Implementar Banco de Dados, Sistema Linux, Testes e Manutenção do Sistema e Projeto Integrador.',
      period: DateTimeRange(start: DateTime(2019, 1), end: DateTime(2025, 1)),
    ),
  ];

  void loadProjects() async {
    List<ProjectModel> p = [];

    final speedLog = ProjectModel(
      title: 'Speed Log',
      description: await rootBundle.loadString(
        'lib/src/assets/descriptions/speedlog.md',
      ),
      status: ProjectStatus.inProgress,
      imageUrls: [
        'lib/src/assets/images/speedlog_1.png',
        'lib/src/assets/images/speedlog_2.png',
      ],
      demoUrl: 'https://web-gray-seven-38.vercel.app/',
      technologies: [
        Technologies.flutter,
        Technologies.dart,
        Technologies.nextJs,
        Technologies.nodeJs,
        Technologies.tailwind,
        Technologies.ts,
        Technologies.postgresql,
      ],
      tags: [
        Tags.mobile,
        Tags.web,
        Tags.auth,
        Tags.pagination,
        Tags.sql,
        Tags.apiRESTful,
        Tags.http,
        Tags.windows,
        Tags.linux,
        Tags.mac,
        Tags.frontend,
        Tags.backend,
      ],
    );

    final treeGen = ProjectModel(
      title: 'TreeGen',
      description: await rootBundle.loadString(
        'lib/src/assets/descriptions/treegen.md',
      ),
      status: ProjectStatus.completed,
      imageUrls: [
        'lib/src/assets/images/treegen_1.png',
        'lib/src/assets/images/treegen_2.png',
        'lib/src/assets/images/treegen_3.png',
      ],
      repositoryUrl: '$baseUrl/treegen',
      releaseUrl: 'https://github.com/gustavoomart/treegen/releases/latest',
      technologies: [Technologies.golang],
      tags: [
        Tags.cli,
        Tags.windows,
        Tags.linux,
        Tags.mac,
        Tags.devTool,
        Tags.ascii,
      ],
    );

    final numericalMethods = ProjectModel(
      title: 'Metodos Numéricos',
      description: await rootBundle.loadString(
        'lib/src/assets/descriptions/metodos_numericos.md',
      ),
      status: ProjectStatus.completed,
      imageUrls: [
        'lib/src/assets/images/metodos_numericos_1.png',
        'lib/src/assets/images/metodos_numericos_2.png',
      ],
      repositoryUrl: '$baseUrl/metodos-numericos',
      technologies: [Technologies.python],
      tags: [
        Tags.calculos,
        Tags.math,
        Tags.graph,
        Tags.physic,
        Tags.dataAnalysis,
      ],
    );

    final triviaGame = ProjectModel(
      title: 'Trivia Game',
      description: await rootBundle.loadString(
        'lib/src/assets/descriptions/trivia_react_js.md',
      ),
      status: ProjectStatus.completed,
      imageUrls: [
        'lib/src/assets/images/trivia_game_1.png',
        'lib/src/assets/images/trivia_game_2.png',
        'lib/src/assets/images/trivia_game_3.png',
      ],
      repositoryUrl: '$baseUrl/trivia-react-js',
      demoUrl: 'https://gustavoomart.github.io/trivia-react-js/',
      technologies: [
        Technologies.js,
        Technologies.react,
        Technologies.tailwind,
        Technologies.vite,
      ],
      tags: [Tags.web, Tags.game, Tags.apiRESTful, Tags.frontend],
    );

    final pokedexApp = ProjectModel(
      title: 'Pokedex App - Ionic + Angular(Ts)',
      description: await rootBundle.loadString(
        'lib/src/assets/descriptions/pokedex.md',
      ),
      status: ProjectStatus.completed,
      imageUrls: [
        'lib/src/assets/images/pokedex_1.png',
        'lib/src/assets/images/pokedex_2.png',
        'lib/src/assets/images/pokedex_3.png',
      ],
      repositoryUrl: '$baseUrl/ionic-angular-pokedex',
      demoUrl: 'https://gustavoomart.github.io/ionic-angular-pokedex/',
      technologies: [
        Technologies.ts,
        Technologies.ionic,
        Technologies.angular,
        Technologies.sqlite,
      ],
      tags: [Tags.web, Tags.apiRESTful, Tags.localStorage, Tags.frontend],
    );

    final wpAutoLinker = ProjectModel(
      title: 'WP Auto Linker',
      description: await rootBundle.loadString(
        'lib/src/assets/descriptions/autolinker.md',
      ),
      status: ProjectStatus.completed,
      imageUrls: [
        'lib/src/assets/images/autolinker_1.png',
        'lib/src/assets/images/autolinker_2.png',
        'lib/src/assets/images/autolinker_3.png',
      ],
      repositoryUrl: '$baseUrl/wp-auto-linker',
      technologies: [Technologies.php, Technologies.wordpress],
      tags: [Tags.web, Tags.frontend, Tags.backend],
    );

    final energyCostCalculator = ProjectModel(
      title: 'Energy Cost Calculator',
      description: await rootBundle.loadString(
        'lib/src/assets/descriptions/energy_cost.md',
      ),
      status: ProjectStatus.completed,
      imageUrls: [
        'lib/src/assets/images/energy_calculator_1.png',
        'lib/src/assets/images/energy_calculator_2.png',
        'lib/src/assets/images/energy_calculator_3.png',
        'lib/src/assets/images/energy_calculator_4.png',
      ],
      repositoryUrl: '$baseUrl/energy-cost-calculator',
      demoUrl: 'https://gustavoomart.github.io/energy-cost-calculator/',
      technologies: [Technologies.flutter, Technologies.dart],
      tags: [
        Tags.web,
        Tags.frontend,
        Tags.windows,
        Tags.linux,
        Tags.mac,
        Tags.calculos,
        Tags.pdfGen,
      ],
    );

    final typingEffect = ProjectModel(
      title: 'Unity TMPro Typing Effect',
      description: await rootBundle.loadString(
        'lib/src/assets/descriptions/typing_effect.md',
      ),
      status: ProjectStatus.completed,
      imageUrls: [
        'lib/src/assets/images/typing_effect_1.png',
        'lib/src/assets/images/typing_effect_2.png',
        'lib/src/assets/images/typing_effect_3.png',
      ],
      repositoryUrl: '$baseUrl/Unity-TMPro-Typing-Effect',
      technologies: [Technologies.unity, Technologies.csharp],
      tags: [Tags.game, Tags.devTool],
    );

    final flutterColorScheme = ProjectModel(
      title: 'Flutter Color Scheme Snippet (M3)',
      description: await rootBundle.loadString(
        'lib/src/assets/descriptions/flutter_cspicker.md',
      ),
      status: ProjectStatus.completed,
      imageUrls: ['lib/src/assets/images/flutter_cspicker_1.png'],
      repositoryUrl: '$baseUrl/flutter-color-scheme-picker',
      releaseUrl:
          'https://marketplace.visualstudio.com/items?itemName=NiHiL.flutter-color-scheme-picker',
      technologies: [Technologies.ts, Technologies.js],
      tags: [Tags.devTool, Tags.frontend],
    );

    final mauiShoppingList = ProjectModel(
      title: 'Maui Shopping List',
      description: await rootBundle.loadString(
        'lib/src/assets/descriptions/maui_shopping_list.md',
      ),
      status: ProjectStatus.completed,
      imageUrls: [
        'lib/src/assets/images/shopping_list_1.jpg',
        'lib/src/assets/images/shopping_list_2.jpg',
        'lib/src/assets/images/shopping_list_3.jpg',
        'lib/src/assets/images/shopping_list_4.jpg',
        'lib/src/assets/images/shopping_list_5.jpg',
        'lib/src/assets/images/shopping_list_6.jpg',
        'lib/src/assets/images/shopping_list_7.jpg',
        'lib/src/assets/images/shopping_list_8.jpg',
      ],
      repositoryUrl: '$baseUrl/MauiShoppingList',
      technologies: [
        Technologies.csharp,
        Technologies.maui,
        Technologies.sqlite,
      ],
      tags: [
        Tags.windows,
        Tags.mac,
        Tags.linux,
        Tags.mobile,
        Tags.textShare,
        Tags.frontend,
      ],
    );

    final fireWidgets = ProjectModel(
      title: 'Fire Widget\'s',
      description: await rootBundle.loadString(
        'lib/src/assets/descriptions/fire_widgets.md',
      ),
      status: ProjectStatus.completed,
      imageUrls: [
        'lib/src/assets/images/fire_widgets_1.gif',
        'lib/src/assets/images/fire_widgets_2.gif',
        'lib/src/assets/images/fire_widgets_3.gif',
        'lib/src/assets/images/fire_widgets_4.gif',
      ],
      repositoryUrl: '$baseUrl/flutter_fire_widgets',
      releaseUrl: 'https://pub.dev/packages/fire_widgets',
      technologies: [Technologies.flutter, Technologies.dart],
      tags: [
        Tags.web,
        Tags.windows,
        Tags.mac,
        Tags.linux,
        Tags.mobile,
        Tags.frontend,
        Tags.devTool,
        Tags.pubDev,
      ],
    );

    p.add(speedLog);
    p.add(treeGen);
    p.add(flutterColorScheme);
    p.add(pokedexApp);
    p.add(triviaGame);
    p.add(fireWidgets);
    p.add(energyCostCalculator);
    p.add(typingEffect);
    p.add(numericalMethods);
    p.add(mauiShoppingList);
    p.add(wpAutoLinker);
    projects.value = p;
  }

  void loadAboutMe() async {
    aboutMe.value = await rootBundle.loadString(
      'lib/src/assets/descriptions/about_me.md',
    );
  }
}
