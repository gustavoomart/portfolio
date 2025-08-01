import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class AnimatedNetworkBackground extends StatefulWidget {
  final Widget child;
  final Color primaryColor;
  final Color secondaryColor;
  final int nodeCount;
  final double connectionDistance;
  final double animationSpeed;
  final bool showParticles;
  final Color? overlayColor;
  final int overlayAlpha;
  final BlendMode overlayBlendMode;
  final double backgroundIntensity;

  const AnimatedNetworkBackground({
    super.key,
    required this.child,
    this.primaryColor = const Color(0xFF64B5F6),
    this.secondaryColor = const Color(0xFF42A5F5),
    this.nodeCount = 35,
    this.connectionDistance = 150.0,
    this.animationSpeed = 1.0,
    this.showParticles = true,
    this.overlayColor,
    this.overlayAlpha = 128,
    this.overlayBlendMode = BlendMode.multiply,
    this.backgroundIntensity = 1.0,
  });

  @override
  State<AnimatedNetworkBackground> createState() =>
      _AnimatedNetworkBackgroundState();
}

class _AnimatedNetworkBackgroundState extends State<AnimatedNetworkBackground>
    with SingleTickerProviderStateMixin {
  late Ticker _ticker;
  double _time = 0.0;
  late List<NetworkNode> _nodes;
  late List<NetworkParticle> _particles;

  @override
  void initState() {
    super.initState();
    _generateNodes();
    _generateParticles();
    _ticker = createTicker(_onTick);
    _ticker.start();
  }

  void _generateNodes() {
    final random = math.Random(42);
    _nodes = List.generate(widget.nodeCount, (index) {
      return NetworkNode(
        id: index,
        x: random.nextDouble(),
        y: random.nextDouble(),
        vx: (random.nextDouble() - 0.5) * 0.02 * widget.animationSpeed,
        vy: (random.nextDouble() - 0.5) * 0.02 * widget.animationSpeed,
        radius: 2.0 + random.nextDouble() * 3.0,
        pulseSpeed: 1.0 + random.nextDouble() * 2.0,
        pulsePhase: random.nextDouble() * math.pi * 2,
      );
    });
  }

  void _generateParticles() {
    if (!widget.showParticles) {
      _particles = [];
      return;
    }

    final random = math.Random(123);
    _particles = List.generate(50, (index) {
      return NetworkParticle(
        x: random.nextDouble(),
        y: random.nextDouble(),
        vx: (random.nextDouble() - 0.5) * 0.005,
        vy: (random.nextDouble() - 0.5) * 0.005,
        life: random.nextDouble(),
        maxLife: 3.0 + random.nextDouble() * 2.0,
      );
    });
  }

  void _onTick(Duration elapsed) {
    setState(() {
      _time = elapsed.inMilliseconds / 1000.0;
      _updateNodes();
      _updateParticles();
    });
  }

  void _updateNodes() {
    for (var node in _nodes) {
      node.update();
    }
  }

  void _updateParticles() {
    for (var particle in _particles) {
      particle.update();
    }
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(-0.3, -0.5),
          radius: 1.8,
          colors: [
            Color(0xFF0a0a0a),
            Color(0xFF1a1a2e),
            Color(0xFF16213e),
            Color(0xFF0a0a0a),
          ],
          stops: [0.0, 0.3, 0.7, 1.0],
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: GridPainter(
                time: _time,
                color: widget.primaryColor.withAlpha(8),
              ),
            ),
          ),
          Positioned.fill(
            child: Opacity(
              opacity: widget.backgroundIntensity,
              child: CustomPaint(
                painter: NetworkPainter(
                  nodes: _nodes,
                  particles: _particles,
                  time: _time,
                  primaryColor: widget.primaryColor,
                  secondaryColor: widget.secondaryColor,
                  connectionDistance: widget.connectionDistance,
                  showParticles: widget.showParticles,
                ),
              ),
            ),
          ),
          if (widget.overlayColor != null)
            Positioned.fill(
              child: Container(
                color: widget.overlayColor!.withAlpha(widget.overlayAlpha),
              ),
            ),

          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 1.2,
                  colors: [Colors.transparent, Colors.black.withAlpha(77)],
                  stops: [0.6, 1.0],
                ),
              ),
            ),
          ),
          widget.child,
        ],
      ),
    );
  }
}

class NetworkNode {
  final int id;
  double x, y;
  double vx, vy;
  final double radius;
  final double pulseSpeed;
  final double pulsePhase;

  NetworkNode({
    required this.id,
    required this.x,
    required this.y,
    required this.vx,
    required this.vy,
    required this.radius,
    required this.pulseSpeed,
    required this.pulsePhase,
  });

  void update() {
    x += vx;
    y += vy;

    if (x <= 0 || x >= 1) {
      vx *= -1;
      x = x.clamp(0.0, 1.0);
    }
    if (y <= 0 || y >= 1) {
      vy *= -1;
      y = y.clamp(0.0, 1.0);
    }
  }

  Offset getPosition(Size size) {
    return Offset(x * size.width, y * size.height);
  }

  double getPulse(double time) {
    return 0.7 + 0.3 * math.sin(time * pulseSpeed + pulsePhase);
  }
}

class NetworkParticle {
  double x, y;
  double vx, vy;
  double life;
  final double maxLife;

  NetworkParticle({
    required this.x,
    required this.y,
    required this.vx,
    required this.vy,
    required this.life,
    required this.maxLife,
  });

  void update() {
    x += vx;
    y += vy;
    life += 0.016;

    if (x < 0) x = 1;
    if (x > 1) x = 0;
    if (y < 0) y = 1;
    if (y > 1) y = 0;

    if (life > maxLife) {
      life = 0;
      final random = math.Random();
      x = random.nextDouble();
      y = random.nextDouble();
    }
  }

  Offset getPosition(Size size) {
    return Offset(x * size.width, y * size.height);
  }

  double getOpacity() {
    return (1.0 - (life / maxLife)) * 0.5;
  }
}

class NetworkPainter extends CustomPainter {
  final List<NetworkNode> nodes;
  final List<NetworkParticle> particles;
  final double time;
  final Color primaryColor;
  final Color secondaryColor;
  final double connectionDistance;
  final bool showParticles;

  NetworkPainter({
    required this.nodes,
    required this.particles,
    required this.time,
    required this.primaryColor,
    required this.secondaryColor,
    required this.connectionDistance,
    required this.showParticles,
  });

  @override
  void paint(Canvas canvas, Size size) {
    List<Offset> positions = nodes
        .map((node) => node.getPosition(size))
        .toList();

    _drawConnections(canvas, size, positions);

    if (showParticles) {
      _drawParticles(canvas, size);
    }

    _drawNodes(canvas, size, positions);
  }

  void _drawConnections(Canvas canvas, Size size, List<Offset> positions) {
    for (int i = 0; i < positions.length; i++) {
      for (int j = i + 1; j < positions.length; j++) {
        double distance = (positions[i] - positions[j]).distance;

        if (distance < connectionDistance) {
          double strength = 1.0 - (distance / connectionDistance);

          double pulse = 0.3 + 0.7 * math.sin(time * 2.0 + i * 0.5 + j * 0.3);
          strength *= pulse;

          final gradient = LinearGradient(
            colors: [
              primaryColor.withAlpha((25.5 * strength).round()),
              secondaryColor.withAlpha((153 * strength).round()),
              primaryColor.withAlpha((25.5 * strength).round()),
            ],
            stops: [0.0, 0.5, 1.0],
          );

          final rect = Rect.fromPoints(
            positions[i] - Offset(1, 1),
            positions[j] + Offset(1, 1),
          );

          final paint = Paint()
            ..shader = gradient.createShader(rect)
            ..strokeWidth = 1.0 + strength * 2.0
            ..style = PaintingStyle.stroke
            ..blendMode = BlendMode.screen;

          canvas.drawLine(positions[i], positions[j], paint);

          if (strength > 0.5) {
            _drawConnectionSparks(canvas, positions[i], positions[j], strength);
          }
        }
      }
    }
  }

  void _drawConnectionSparks(
    Canvas canvas,
    Offset start,
    Offset end,
    double strength,
  ) {
    final sparkCount = (strength * 3).round();
    for (int i = 0; i < sparkCount; i++) {
      double t = (i + 1) / (sparkCount + 1);
      Offset sparkPos = Offset.lerp(start, end, t)!;

      double sparkSize = 1.0 + strength * 2.0;
      double sparkOpacity = strength * 0.8;

      final sparkPaint = Paint()
        ..color = secondaryColor.withAlpha((204 * sparkOpacity).round())
        ..style = PaintingStyle.fill
        ..blendMode = BlendMode.screen;

      canvas.drawCircle(sparkPos, sparkSize, sparkPaint);
    }
  }

  void _drawParticles(Canvas canvas, Size size) {
    final particlePaint = Paint()
      ..style = PaintingStyle.fill
      ..blendMode = BlendMode.screen;

    for (var particle in particles) {
      double opacity = particle.getOpacity();
      if (opacity > 0) {
        particlePaint.color = primaryColor.withAlpha((255 * opacity).round());
        canvas.drawCircle(particle.getPosition(size), 1.0, particlePaint);
      }
    }
  }

  void _drawNodes(Canvas canvas, Size size, List<Offset> positions) {
    for (int i = 0; i < nodes.length; i++) {
      final node = nodes[i];
      final position = positions[i];
      double pulse = node.getPulse(time);

      final glowPaint = Paint()
        ..color = primaryColor.withAlpha((77 * pulse).round())
        ..style = PaintingStyle.fill
        ..blendMode = BlendMode.screen;

      canvas.drawCircle(position, node.radius * 3 * pulse, glowPaint);

      final ringPaint = Paint()
        ..color = secondaryColor.withAlpha((153 * pulse).round())
        ..style = PaintingStyle.fill
        ..blendMode = BlendMode.screen;

      canvas.drawCircle(position, node.radius * 1.5 * pulse, ringPaint);

      final corePaint = Paint()
        ..color = Colors.white.withAlpha((230 * pulse).round())
        ..style = PaintingStyle.fill;

      canvas.drawCircle(position, node.radius * pulse, corePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class GridPainter extends CustomPainter {
  final double time;
  final Color color;

  GridPainter({required this.time, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 0.5
      ..style = PaintingStyle.stroke;

    double gridSize = 50.0;
    double offset = (time * 10) % gridSize;

    for (double x = -offset; x < size.width + gridSize; x += gridSize) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    for (double y = -offset; y < size.height + gridSize; y += gridSize) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
