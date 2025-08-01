import 'package:flutter/material.dart';
import 'package:portfolio/src/models/project_model.dart';
import 'package:portfolio/src/view_models/portfolio_vm.dart';
import 'package:portfolio/src/widgets/animated_network_background.dart';
import 'package:portfolio/src/widgets/project_card_widget.dart';

class ProjectsTab extends StatelessWidget {
  const ProjectsTab({super.key, required this.vm});
  final PortfolioViewModel vm;

  @override
  Widget build(BuildContext context) {
    return AnimatedNetworkBackground(
      primaryColor: const Color(0xFF64B5F6),
      secondaryColor: const Color(0xFF42A5F5),
      nodeCount: vm.nodeCount,
      connectionDistance: vm.connectionDistance,
      animationSpeed: vm.animationSpeed,
      overlayColor: Theme.of(context).colorScheme.surface,
      overlayAlpha: 127,
      child: ValueListenableBuilder(
        valueListenable: vm.projects,
        builder: (context, _, _) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  ...vm.projects.value.map((p) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ProjectCardWidget(
                          onTap: (p) => Navigator.pushNamed(
                            context,
                            '/project',
                            arguments: p,
                          ),
                          project: p as ProjectModel,
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
