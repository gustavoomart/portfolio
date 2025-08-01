import 'package:flutter/material.dart';
import 'package:portfolio/src/pages/tabs/about_me_tab.dart';
import 'package:portfolio/src/pages/tabs/education_tab.dart';
import 'package:portfolio/src/pages/tabs/landing_tab.dart';
import 'package:portfolio/src/pages/tabs/projects_tab.dart';
import 'package:portfolio/src/view_models/portfolio_vm.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final vm = PortfolioViewModel();

  @override
  void initState() {
    super.initState();
    vm.loadAboutMe();
    vm.loadProjects();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      animationDuration: Duration(milliseconds: 500),
      length: 4,
      child: Scaffold(
        body: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(text: 'Home'),
                Tab(text: 'Sobre Mim'),
                Tab(text: 'Projetos'),
                Tab(text: 'Educação'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  LandingTab(vm: vm),
                  AboutMeTab(vm: vm),
                  ProjectsTab(vm: vm),
                  EducationTab(vm: vm),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
