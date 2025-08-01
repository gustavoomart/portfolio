import 'package:flutter/material.dart';
import 'package:gpt_markdown/gpt_markdown.dart';
import 'package:portfolio/src/models/project_model.dart';
import 'package:portfolio/src/view_models/portfolio_vm.dart';
import 'package:portfolio/src/widgets/animated_network_background.dart';
import 'package:portfolio/src/widgets/tech_stack_card.dart';

class AboutMeTab extends StatelessWidget {
  const AboutMeTab({super.key, required this.vm});
  final PortfolioViewModel vm;
  @override
  Widget build(BuildContext context) {
    final int stacksPerRow;
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 1080) {
      stacksPerRow = 6;
    } else if (screenWidth >= 824 && screenWidth <= 1080) {
      stacksPerRow = 4;
    } else {
      stacksPerRow = 2;
    }
    final theme = Theme.of(context);
    return AnimatedNetworkBackground(
      primaryColor: const Color(0xFF64B5F6),
      secondaryColor: const Color(0xFF42A5F5),
      nodeCount: vm.nodeCount,
      connectionDistance: vm.connectionDistance,
      animationSpeed: vm.animationSpeed,
      overlayColor: Theme.of(context).colorScheme.surface,
      overlayAlpha: 230,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundImage: AssetImage(
                      'lib/src/assets/images/profile.jpg',
                    ),
                  ),

                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Gustavo Martins Camargo",
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Desenvolvedor Fullstack & Engenheiro Químico",
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 16),

              ValueListenableBuilder(
                valueListenable: vm.aboutMe,
                builder: (context, value, _) {
                  return GptMarkdown(value);
                },
              ),

              const SizedBox(height: 16),

              LayoutBuilder(
                builder: (context, constraints) {
                  final itemWidth =
                      (constraints.maxWidth - 5 * 12) / stacksPerRow;
                  return Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: Technologies.values
                        .map(
                          (tech) => SizedBox(
                            width: itemWidth,
                            height: 100,
                            child: TechStackCard(tech: tech),
                          ),
                        )
                        .toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
