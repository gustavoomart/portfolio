import 'package:animated_glitch/animated_glitch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/src/view_models/portfolio_vm.dart';
import 'package:portfolio/src/widgets/animated_network_background.dart';
import 'package:portfolio/src/widgets/contact_chip.dart';

class LandingTab extends StatelessWidget {
  LandingTab({super.key, required this.vm});
  final PortfolioViewModel vm;
  final ctrl = AnimatedGlitchController(
    frequency: Duration(milliseconds: 800),
    level: 0.5,
    chance: 70,
    distortionShift: DistortionShift(count: 4),
  );
  @override
  Widget build(BuildContext context) {
    return AnimatedNetworkBackground(
      primaryColor: const Color(0xFF64B5F6),
      secondaryColor: const Color(0xFF42A5F5),
      nodeCount: vm.nodeCount,
      connectionDistance: vm.connectionDistance,
      animationSpeed: vm.animationSpeed,
      overlayColor: Theme.of(context).colorScheme.surface,
      overlayAlpha: 102,
      child: Stack(
        children: [
          AnimatedGlitch(
            controller: ctrl,
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 64),
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage(
                    'lib/src/assets/images/profile.jpg',
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Gustavo Martins Camargo',
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                fontFamily: 'Space',
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Row(
                spacing: 16,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ContactChip(
                    label: 'GitHub',
                    icon: 'lib/src/assets/icons/github.svg',
                    url: 'https://github.com/gustavoomart',
                  ),
                  ContactChip(
                    label: 'LinkedIn',
                    icon: 'lib/src/assets/icons/linkedin.svg',
                    url: 'https://www.linkedin.com/in/gustavo-martins-camargo/',
                  ),
                  ContactChip(
                    label: 'gustavomartinsv@gmail.com',
                    icon: 'lib/src/assets/icons/email.svg',
                    onTap: () {
                      Clipboard.setData(
                        ClipboardData(text: 'gustavomartinsv@gmail.com'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Email copiado para a área de transferência!',
                          ),
                        ),
                      );
                    },
                  ),
                  ContactChip(
                    label: '(48) 9 9839-7062',
                    icon: 'lib/src/assets/icons/whatsapp.svg',
                    url: 'https://wa.me/5548998397062',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
