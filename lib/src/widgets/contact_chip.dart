import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactChip extends StatefulWidget {
  const ContactChip({
    super.key,
    required this.icon,
    required this.label,
    this.url,
    this.textToCopy,
    this.onTap,
    this.radius = 18,
  });
  final String label;
  final String? url;
  final String? textToCopy;
  final String icon;
  final Function? onTap;
  final double radius;

  @override
  State<ContactChip> createState() => _ContactChipState();
}

class _ContactChipState extends State<ContactChip> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          if (widget.onTap != null) {
            widget.onTap!();
          }
          if (widget.url != null) {
            final uri = Uri.parse(widget.url!);
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri, mode: LaunchMode.externalApplication);
            } else {
              throw 'Não foi possível abrir $uri';
            }
          }
        },
        child: Chip(
          label: Text(widget.label),
          avatar: SvgPicture.asset(
            widget.icon,
            width: widget.radius,
            height: widget.radius,
          ),
        ),
      ),
    );
  }
}
