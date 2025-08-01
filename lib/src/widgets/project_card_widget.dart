import 'package:animated_glitch/animated_glitch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/src/models/project_model.dart';

class ProjectCardWidget extends StatefulWidget {
  final ProjectModel project;
  final void Function(ProjectModel) onTap;
  const ProjectCardWidget({
    super.key,
    required this.project,
    required this.onTap,
  });

  @override
  State<ProjectCardWidget> createState() => _ProjectCardWidgetState();
}

class _ProjectCardWidgetState extends State<ProjectCardWidget> {
  late final AnimatedGlitchController ctrl;

  @override
  void initState() {
    ctrl = AnimatedGlitchController(
      autoStart: false,
      frequency: Duration(milliseconds: 300),
      level: 1,
      chance: 70,
      distortionShift: DistortionShift(count: 4),
    );
    super.initState();
  }

  @override
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => ctrl.start(),
      onExit: (_) => ctrl.stop(),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => widget.onTap(widget.project),
        child: AnimatedGlitch(
          controller: ctrl,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                children: [
                  Text(
                    widget.project.title,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  SizedBox(width: 16),
                  Wrap(
                    spacing: 8,
                    children: widget.project.technologies.map((tech) {
                      return SvgPicture.asset(
                        tech.iconPath,
                        width: 18,
                        height: 18,
                      );
                    }).toList(),
                  ),

                  Spacer(),
                  Icon(Icons.arrow_forward_ios_outlined),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
