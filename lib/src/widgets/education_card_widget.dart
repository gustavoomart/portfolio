import 'package:animated_glitch/animated_glitch.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/src/models/education_model.dart';

class EducationCardWidget extends StatefulWidget {
  const EducationCardWidget({super.key, required this.education});
  final EducationModel education;

  @override
  State<EducationCardWidget> createState() => _EducationCardWidgetState();
}

class _EducationCardWidgetState extends State<EducationCardWidget> {
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

  String _formatPeriod(DateTimeRange range) {
    final format = DateFormat('MMM yyyy', 'pt_BR');
    return '${format.format(range.start)} - ${format.format(range.end)}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MouseRegion(
      onEnter: (_) => ctrl.start(),
      onExit: (_) => ctrl.stop(),
      child: AnimatedGlitch(
        controller: ctrl,

        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 12),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.education.title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),

                Row(
                  children: [
                    const Icon(Icons.school, size: 18),
                    const SizedBox(width: 6),
                    Text(
                      '${widget.education.institution}, ${widget.education.city}',
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 18),
                    const SizedBox(width: 6),
                    Text(
                      _formatPeriod(widget.education.period),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.textTheme.bodySmall?.color?.withAlpha(178),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                Text(
                  widget.education.description,
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
