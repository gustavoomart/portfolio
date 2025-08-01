import 'package:flutter/material.dart';
import 'package:portfolio/src/view_models/portfolio_vm.dart';
import 'package:portfolio/src/widgets/animated_network_background.dart';
import 'package:portfolio/src/widgets/education_card_widget.dart';

class EducationTab extends StatelessWidget {
  const EducationTab({super.key, required this.vm});
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
      overlayAlpha: 0,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              ...vm.educations.map((education) {
                return SizedBox(
                  width: double.infinity,
                  height: 194,
                  child: EducationCardWidget(education: education),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
