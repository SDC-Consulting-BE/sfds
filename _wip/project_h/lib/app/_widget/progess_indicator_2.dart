import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

// =======================================================
// 1. DUST BRUSH INDICATOR (Linear Sweep with Particle Effect)
// =======================================================

// --- Particle Model ---
// Represents a single dust particle with simple physics
class Particle {
  Offset position;
  Offset velocity;
  int age = 0;
  final int maxAge;

  Particle(this.position, this.velocity, this.maxAge);

  void update() {
    position += velocity;
    age++;
  }

  bool isAlive() => age < maxAge;
}

class DustBrushIndicator extends StatefulWidget {
  final Color brushColor;
  final Color trailColor;
  final double size;

  const DustBrushIndicator({
    super.key,
    this.brushColor = const Color(0xFF9E9E9E), // Grey brush
    this.trailColor = const Color(0xFFB0BEC5), // Light grey trail
    this.size = 150.0,
  });

  @override
  State<DustBrushIndicator> createState() => _DustBrushIndicatorState();
}

class _DustBrushIndicatorState extends State<DustBrushIndicator> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  List<Particle> _particles = [];
  final Random _rand = Random();
  double _lastValue = 0.0;

  // Controls how close the brush must be to the edge to trigger a burst
  static const double _particleBurstThreshold = 0.03;

  @override
  void initState() {
    super.initState();
    // Use repeat(reverse: true) for linear back-and-forth movement (0 -> 1 -> 0)
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    // Listen to every tick for particle generation and physics updates
    _controller.addListener(_handleAnimationTick);
  }

  // Logic to handle animation updates, particle generation, and particle physics
  void _handleAnimationTick() {
    final value = _controller.value;
    final direction = value - _lastValue;

    // --- Particle Generation Logic ---
    // Check if the brush hit the right edge (value close to 1.0 and moving left)
    if (value >= 1.0 - _particleBurstThreshold && direction < 0 && _particles.isEmpty) {
      _generateDustBurst(1.0);
    }
    // Check if the brush hit the left edge (value close to 0.0 and moving right)
    else if (value <= _particleBurstThreshold && direction > 0 && _particles.isEmpty) {
      _generateDustBurst(0.0);
    }

    // --- Particle Physics Update ---
    _updateParticles();

    _lastValue = value;
    // setState ensures the CustomPainter is redrawn with updated particle positions
    setState(() {});
  }

  // Generates a burst of particles at the given edge (0.0 for left, 1.0 for right)
  void _generateDustBurst(double positionRatio) {
    if (_particles.isNotEmpty) return; // Wait for the current burst to finish

    final double size = widget.size;

    // Determine the burst origin (left or right edge of the square area)
    final originX = size * positionRatio;
    final originY = size / 2;

    final Offset origin = Offset(originX, originY);

    // Direction multiplier for velocity: 1.0 for particles moving left, -1.0 for particles moving right
    final directionMultiplier = (positionRatio == 1.0) ? 1.0 : -1.0;

    for (int i = 0; i < 20; i++) {
      // Angle randomized slightly above and below the horizontal direction
      final double angle = _rand.nextDouble() * pi / 2 - pi / 4; // -45 to +45 degrees

      // Flip the angle and horizontal direction if the burst is on the right edge
      final double effectiveAngle = angle + (positionRatio == 1.0 ? pi : 0.0);

      final double speed = _rand.nextDouble() * 2 + 1; // Speed 1 to 3

      final velocity = Offset(
        cos(effectiveAngle) * speed * directionMultiplier,
        sin(effectiveAngle) * speed * 0.5, // Less vertical movement
      );

      _particles.add(
        Particle(
          origin,
          velocity,
          _rand.nextInt(30) + 40, // maxAge 40 to 70 frames
        ),
      );
    }
  }

  void _updateParticles() {
    // Update position and age of all live particles
    for (final p in _particles) {
      p.update();
      // Apply slight gravity/damping
      p.velocity = Offset(p.velocity.dx * 0.99, p.velocity.dy * 0.99 + 0.1);
    }

    // Remove dead particles
    _particles.removeWhere((p) => !p.isAlive());
  }

  @override
  void dispose() {
    _controller.removeListener(_handleAnimationTick);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Use an interpolated value for smoother motion (Linear curve is default)
    final animation = CurvedAnimation(parent: _controller, curve: Curves.linear);

    return SizedBox.square(
      dimension: widget.size,
      child: CustomPaint(
        painter: DustBrushPainter(
          animationValue: animation.value,
          brushColor: widget.brushColor,
          trailColor: widget.trailColor,
          particles: _particles,
        ),
      ),
    );
  }
}

class DustBrushPainter extends CustomPainter {
  final double animationValue; // 0.0 (left) to 1.0 (right)
  final Color brushColor;
  final Color trailColor;
  final List<Particle> particles;

  DustBrushPainter({
    required this.animationValue,
    required this.brushColor,
    required this.trailColor,
    required this.particles,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;

    // --- Brush Dimensions ---
    const double brushWidth = 40.0; // Width of the brush bristles
    const double brushHeight = 60.0;
    const double handleLength = 30.0;

    // Calculate Brush X Position
    // The center of the brush moves from brushWidth/2 to width - brushWidth/2
    // We adjust the brush center to always stay visible within the area
    final brushXCenter = (width - brushWidth) * animationValue + (brushWidth / 2);

    // --- 1. Draw the Fading Trail ---

    final trailRect = Rect.fromLTRB(0.0, 0.0, width, height);

    // Create a radial gradient centered on the brush to mimic a cleaned path
    // The clean area follows the brush
    final radialCenter = Offset(brushXCenter, height / 2);
    final gradientPaint = ui.Paint()
      // FIX: Assign the result of ui.Gradient.radial (which is already a ui.Shader) directly to the shader property
      ..shader = ui.Gradient.radial(
        radialCenter,
        width / 3,
        [
          trailColor.withOpacity(0.4), // Cleanest at the center
          Colors.transparent,
        ],
        const [0.0, 1.0],
        ui.TileMode.clamp, // Added TileMode argument which is required for this factory method
      );

    canvas.drawRect(trailRect, gradientPaint);

    // --- 2. Draw the Brush ---

    // Brush Bristles (The rectangular part)
    final brushRect = Rect.fromCenter(
      center: Offset(brushXCenter, height / 2),
      width: brushWidth,
      height: brushHeight,
    );
    final brushPaint = ui.Paint()..color = brushColor;
    canvas.drawRect(brushRect, brushPaint);

    // Brush Handle (Small rectangle on top)
    final handleRect = Rect.fromLTWH(
      brushXCenter - brushWidth / 4,
      height / 2 - brushHeight / 2 - handleLength / 2,
      brushWidth / 2,
      handleLength,
    );
    final handlePaint = ui.Paint()..color = Colors.brown.shade700;
    canvas.drawRect(handleRect, handlePaint);

    // --- 3. Draw the Dust Particles ---
    final particlePaint = ui.Paint()..style = ui.PaintingStyle.fill;

    for (final p in particles) {
      // Particle opacity fades based on age
      final particleOpacity = p.isAlive() ? (1.0 - p.age / p.maxAge) : 0.0;

      if (particleOpacity > 0.0) {
        // Dust is white/light
        particlePaint.color = Colors.white.withOpacity(particleOpacity);
        // Draw the particle (small circle, size depends on opacity)
        canvas.drawCircle(p.position, 2.0 * particleOpacity, particlePaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant DustBrushPainter oldDelegate) {
    // Repaint if the brush moves or the number of particles changes
    return oldDelegate.animationValue != animationValue || oldDelegate.particles.length != particles.length;
  }
}
