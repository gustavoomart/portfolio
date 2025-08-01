import 'package:flutter/material.dart';

enum ProjectStatus {
  inProgress('Em progresso', Colors.orange, Colors.black),
  completed('Concluído', Colors.green, Colors.white),
  paused('Pausado', Colors.blueGrey, Colors.white),
  canceled('Cancelado', Colors.red, Colors.white);

  final String label;
  final Color backgroundColor;
  final Color textColor;

  const ProjectStatus(this.label, this.backgroundColor, this.textColor);
}

enum Technologies {
  csharp(
    label: 'C Sharp',
    iconPath: 'lib/src/assets/icons/csharp.svg',
    note: 3,
    url: 'https://dotnet.microsoft.com/en-us/languages/csharp',
  ),
  unity(
    label: 'Unity',
    iconPath: 'lib/src/assets/icons/unity.svg',
    note: 3,
    url: 'https://unity.com',
  ),
  dart(
    label: 'Dart',
    iconPath: 'lib/src/assets/icons/dart.svg',
    note: 3,
    url: 'https://dart.dev',
  ),
  flutter(
    label: 'Flutter',
    iconPath: 'lib/src/assets/icons/flutter.svg',
    note: 3,
    url: 'https://flutter.dev',
  ),
  python(
    label: 'Python',
    iconPath: 'lib/src/assets/icons/python.svg',
    note: 2,
    url: 'https://www.python.org',
  ),
  java(
    label: 'Java',
    iconPath: 'lib/src/assets/icons/java.svg',
    note: 3,
    url: 'https://www.java.com',
  ),
  angular(
    label: 'Angular',
    iconPath: 'lib/src/assets/icons/angular.svg',
    note: 2,
    url: 'https://angular.dev',
  ),
  ts(
    label: 'TypeScript',
    iconPath: 'lib/src/assets/icons/typescript.svg',
    note: 2,
    url: 'https://typescriptlang.org',
  ),
  ionic(
    label: 'Ionic',
    iconPath: 'lib/src/assets/icons/ionic.svg',
    note: 2,
    url: 'https://ionicframework.com',
  ),
  octave(
    label: 'Octave',
    iconPath: 'lib/src/assets/icons/octave.svg',
    note: 2,
    url: 'https://octave.org',
  ),
  matlab(
    label: 'Matlab',
    iconPath: 'lib/src/assets/icons/matlab.svg',
    note: 2,
    url: 'https://www.mathworks.com/products/matlab.html',
  ),
  postgresql(
    label: 'PostgreSQL',
    iconPath: 'lib/src/assets/icons/postgresql.svg',
    note: 2,
    url: 'https://www.postgresql.org',
  ),
  nextJs(
    label: 'Next.js',
    iconPath: 'lib/src/assets/icons/next-js.svg',
    note: 1,
    url: 'https://nextjs.org',
  ),
  godot(
    label: 'Godot',
    iconPath: 'lib/src/assets/icons/godot.svg',
    note: 2,
    url: 'https://godotengine.org',
  ),
  git(
    label: 'Git',
    iconPath: 'lib/src/assets/icons/git.svg',
    note: 3,
    url: 'https://git-scm.com',
  ),
  sqlite(
    label: 'SQLite',
    iconPath: 'lib/src/assets/icons/sqlite.svg',
    note: 3,
    url: 'https://sqlite.org',
  ),
  golang(
    label: 'Golang',
    iconPath: 'lib/src/assets/icons/go.svg',
    note: 2,
    url: 'https://go.dev',
  ),
  powerBi(
    label: 'Power BI',
    iconPath: 'lib/src/assets/icons/power-bi.svg',
    note: 1,
    url: 'https://powerbi.com/',
  ),
  js(
    label: 'JavaScript',
    iconPath: 'lib/src/assets/icons/js.svg',
    note: 2,
    url: 'https://developer.mozilla.org/pt-BR/docs/Web/JavaScript',
  ),
  react(
    label: 'React',
    iconPath: 'lib/src/assets/icons/react.svg',
    note: 2,
    url: 'https://react.dev',
  ),
  vite(
    label: 'Vite',
    iconPath: 'lib/src/assets/icons/vite.svg',
    note: 2,
    url: 'https://vite.dev',
  ),
  delphi(
    label: 'Delphi',
    iconPath: 'lib/src/assets/icons/delphi.svg',
    note: 1,
    url: 'https://www.embarcadero.com/products/delphi',
  ),
  tailwind(
    label: 'Tailwind',
    iconPath: 'lib/src/assets/icons/tailwind.svg',
    note: 2,
    url: 'https://tailwindcss.com',
  ),
  nodeJs(
    label: 'Node.js',
    iconPath: 'lib/src/assets/icons/node-js.svg',
    note: 2,
    url: 'https://nodejs.org',
  ),
  wordpress(
    label: 'WordPress',
    iconPath: 'lib/src/assets/icons/wordpress.svg',
    note: 1,
    url: 'https://wordpress.com',
  ),
  php(
    label: 'PHP',
    iconPath: 'lib/src/assets/icons/php.svg',
    note: 1,
    url: 'https://www.php.net',
  ),
  maui(
    label: 'MAUI',
    iconPath: 'lib/src/assets/icons/maui.svg',
    note: 2,
    url: 'https://learn.microsoft.com/dotnet/maui',
  ),
  flstudio(
    label: 'FL Studio',
    iconPath: 'lib/src/assets/icons/fl-studio.svg',
    note: 2,
    url: 'https://www.image-line.com/fl-studio',
  ),
  blender(
    label: 'Blender',
    iconPath: 'lib/src/assets/icons/blender.svg',
    note: 2,
    url: 'https://www.blender.org',
  ),
  bitwig(
    label: 'Bitwig',
    iconPath: 'lib/src/assets/icons/bitwig.svg',
    note: 3,
    url: 'https://www.bitwig.com',
  ),
  aseprite(
    label: 'Aseprite',
    iconPath: 'lib/src/assets/icons/aseprite.svg',
    note: 2,
    url: 'https://www.aseprite.org',
  );

  final String label;
  final String iconPath;
  final String url;
  final int note;

  const Technologies({
    required this.label,
    required this.iconPath,
    required this.note,
    required this.url,
  });
}

enum Tags {
  mobile('Mobile'),
  auth('Autenticação'),
  web('Web'),
  sql('SQL'),
  pubDev('Pub.Dev'),
  pagination('Paginação'),
  textShare('Compartilhamento de texto'),
  http('HTTP'),
  cli('CLI'),
  windows('Windows'),
  linux('Linux'),
  mac('Mac'),
  devTool('Dev Tool'),
  ascii('ASCII'),
  calculos('Cálculo'),
  pdfGen('Geração de PDF'),
  math('Matemática'),
  graph('Gráfico'),
  physic('Física'),
  dataAnalysis('Análise de dados'),
  game('Jogo'),
  frontend('Front-end'),
  backend('Back-end'),
  localStorage('Armazenamento local'),
  apiRESTful('API RESTful');

  final String label;

  const Tags(this.label);
}

class ProjectModel {
  final String title;
  final String description;
  final ProjectStatus status;
  final List<String> imageUrls;
  final String? repositoryUrl;
  final String? demoUrl;
  final String? releaseUrl;
  final List<Technologies> technologies;
  final List<Tags> tags;

  ProjectModel({
    required this.title,
    required this.description,
    required this.status,
    required this.imageUrls,
    required this.technologies,
    this.repositoryUrl,
    this.demoUrl,
    this.releaseUrl,
    required this.tags,
  });
}
