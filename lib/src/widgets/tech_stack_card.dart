import 'package:animated_glitch/animated_glitch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/src/models/project_model.dart';
import 'package:url_launcher/url_launcher.dart';

class TechStackCard extends StatefulWidget {
  const TechStackCard({super.key, required this.tech});
  final Technologies tech;

  @override
  State<TechStackCard> createState() => _TechStackCardState();
}

class _TechStackCardState extends State<TechStackCard> {
  final double imageSize = 40;

  late final AnimatedGlitchController ctrl;

  @override
  void initState() {
    ctrl = AnimatedGlitchController(
      autoStart: false,
      frequency: Duration(milliseconds: 300),
      level: 2,
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
      onEnter: (_) {
        ctrl.start();
      },
      onExit: (_) {
        ctrl.stop();
      },
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          final uri = Uri.parse(widget.tech.url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          } else {
            throw 'Não foi possível abrir $uri';
          }
        },
        child: AnimatedGlitch(
          controller: ctrl,
          child: Card(
            elevation: 17,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    widget.tech.iconPath,
                    width: imageSize,
                    height: imageSize,
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.tech.label,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: List.generate(
                          3,
                          (index) => Icon(
                            index < widget.tech.note
                                ? Icons.star
                                : Icons.star_border,
                            size: 20,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
