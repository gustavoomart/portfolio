import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gpt_markdown/gpt_markdown.dart';
import 'package:portfolio/src/models/project_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectPage extends StatefulWidget {
  final ProjectModel project;

  const ProjectPage({super.key, required this.project});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  late CarouselController ctrl;
  @override
  void initState() {
    super.initState();
    ctrl = CarouselController();
  }

  @override
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.project.title),
        actions: [
          Chip(
            label: Text(
              widget.project.status.label,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: widget.project.status.textColor,
              ),
            ),
            backgroundColor: widget.project.status.backgroundColor,
          ),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.project.imageUrls.isNotEmpty)
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 400,
                      minHeight: 300,
                    ),
                    child: CarouselView.weighted(
                      controller: ctrl,
                      flexWeights: [1, 15, 1],
                      shrinkExtent: 200,
                      onTap: (i) {
                        ctrl.animateToItem(i);
                      },
                      children: widget.project.imageUrls.map((imageUrl) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              imageUrl,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey[300],
                                  child: const Icon(
                                    Icons.error,
                                    color: Colors.grey,
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                SizedBox(height: 16),
                GptMarkdown(widget.project.description),
                SizedBox(height: 16),

                Text(
                  widget.project.technologies.length > 1
                      ? 'Tecnologias'
                      : 'Tecnologia',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,

                  children: widget.project.technologies.map((tech) {
                    return Chip(
                      avatar: SvgPicture.asset(
                        tech.iconPath,
                        width: 18,
                        height: 18,
                      ),

                      label: Text(tech.label),
                    );
                  }).toList(),
                ),

                Divider(height: 32),

                Text(
                  widget.project.tags.length > 1
                      ? 'Características'
                      : 'Característica',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(height: 8),

                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: widget.project.tags.map((tech) {
                    return Chip(label: Text(tech.label));
                  }).toList(),
                ),

                SizedBox(height: 16),

                OverflowBar(
                  alignment: MainAxisAlignment.end,
                  spacing: 8,
                  children: [
                    Builder(
                      builder: (context) {
                        if (widget.project.repositoryUrl != null) {
                          return ElevatedButton(
                            onPressed: () async {
                              final uri = Uri.parse(
                                widget.project.repositoryUrl!,
                              );
                              if (await canLaunchUrl(uri)) {
                                await launchUrl(
                                  uri,
                                  mode: LaunchMode.externalApplication,
                                );
                              } else {
                                throw 'Não foi possível abrir $uri';
                              }
                            },
                            child: Text('Repositório'),
                          );
                        }
                        return SizedBox.shrink();
                      },
                    ),

                    Builder(
                      builder: (context) {
                        if (widget.project.demoUrl != null) {
                          return ElevatedButton(
                            onPressed: () async {
                              final uri = Uri.parse(widget.project.demoUrl!);
                              if (await canLaunchUrl(uri)) {
                                await launchUrl(
                                  uri,
                                  mode: LaunchMode.externalApplication,
                                );
                              } else {
                                throw 'Não foi possível abrir $uri';
                              }
                            },
                            child: Text('Demonstração'),
                          );
                        }
                        return SizedBox.shrink();
                      },
                    ),

                    Builder(
                      builder: (context) {
                        if (widget.project.releaseUrl != null) {
                          return ElevatedButton(
                            onPressed: () async {
                              final uri = Uri.parse(widget.project.releaseUrl!);
                              if (await canLaunchUrl(uri)) {
                                await launchUrl(
                                  uri,
                                  mode: LaunchMode.externalApplication,
                                );
                              } else {
                                throw 'Não foi possível abrir $uri';
                              }
                            },
                            child: Text('Release'),
                          );
                        }
                        return SizedBox.shrink();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
